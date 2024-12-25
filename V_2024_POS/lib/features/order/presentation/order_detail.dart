import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:possystem/features/order/models/orderitem_model.dart';
import 'package:possystem/shared/utils/color_constants.dart';

class OrderDetail extends StatelessWidget {
  final OrderItemList orderItemCollection;

  const OrderDetail({super.key, required this.orderItemCollection});

  @override
  Widget build(BuildContext context) {
    final orderDtString = orderItemCollection.orders.orderDt; // String 값// "YYYY-MM-DD HH:mm" 형식으로 포맷// "2016-12-16 16:16" 부분만 가져옴
    String formattedDate = '날짜 정보';

    if (orderDtString != null) {
      try {
        final dateTime = DateTime.parse(orderDtString); // 문자열을 DateTime으로 변환
        formattedDate = DateFormat('yyyy-MM-dd HH:mm').format(dateTime); // "YYYY-MM-DD HH:mm" 형식으로 포맷
      } catch (e) {
        formattedDate = '날짜 형식 오류'; // 변환 실패 시 처리
      }
    }

    return Container(
      constraints: const BoxConstraints(maxHeight: 460, maxWidth: 500), // 최대 높이, 너비 설정
      padding: const EdgeInsets.only(left: 19, right: 19, top: 20, bottom: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 주문 번호와 날짜
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('주문 번호: ${orderItemCollection.orders.orderNum}', style: const TextStyle(fontWeight: FontWeight.bold, color: menuTextColor, fontSize: 20)),
              Text(formattedDate, style: const TextStyle(fontWeight: FontWeight.bold, color: menuTextColor, fontSize: 20)),
            ],
          ),
          const Divider(
            color: tableColumnBackGroundColor,
          ),

          const Row(
            children: [
              Expanded(
                flex: 2, // 비율 맞추기 (제품명 넓게)
                child: Text('제품명', style: TextStyle(fontWeight: FontWeight.bold, color: tableDeleteRowColor, fontSize: 16)),
              ),
              Expanded(
                flex: 1, // 비율 맞추기 (개수 좁게)
                child: Text('개수', style: TextStyle(fontWeight: FontWeight.bold, color: tableDeleteRowColor, fontSize: 16), textAlign: TextAlign.center),
              ),
              Expanded(
                flex: 1, // 비율 맞추기 (가격 좁게)
                child: Text('가격', style: TextStyle(fontWeight: FontWeight.bold, color: tableDeleteRowColor, fontSize: 16), textAlign: TextAlign.right),
              ),
            ],
          ),

          const SizedBox(height: 10), // 헤더와 리스트 사이의 간격

          // 주문 아이템 리스트
          Expanded(
            child: ListView(
              children: [
                Table(
                  columnWidths: const {
                    0: FlexColumnWidth(2), // 첫 번째 열 비율
                    1: FlexColumnWidth(1), // 두 번째 열 비율
                    2: FlexColumnWidth(1), // 세 번째 열 비율
                  },
                  children: orderItemCollection.orderItem.map((orderItem) {
                    return TableRow(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6.0), // 행 간 여백 추가
                          child: Text(
                            '${orderItem['prdName'] ?? '제품명 없음'}',
                            style: const TextStyle(color: menuTextColor, fontSize: 16),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6.0), // 행 간 여백 추가
                          child: Text(
                            '${orderItem['quantity'] ?? 0}개',
                            textAlign: TextAlign.center,
                            style: const TextStyle(color: menuTextColor, fontSize: 16),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6.0), // 행 간 여백 추가
                          child: Text(
                            '${orderItem['prdPrice'] ?? 0}원',
                            textAlign: TextAlign.right,
                            style: const TextStyle(color: menuTextColor, fontSize: 16),
                          ),
                        ),
                      ],
                    );
                  }).toList(),
                ),
              ],
            ),
          ),

          const Divider(
            color: tableColumnBackGroundColor,
          ),
          // 합계 및 버튼
          Row(
            children: [
              const Text('합계: ', style: TextStyle(fontWeight: FontWeight.bold, color: menuTextColor, fontSize: 20)),
              const Spacer(),
              Text('${orderItemCollection.orders.orderPrice}원', style: const TextStyle(fontWeight: FontWeight.bold, color: menuTextColor, fontSize: 20)),
            ],
          ),
        ],
      ),
    );
  }
}
