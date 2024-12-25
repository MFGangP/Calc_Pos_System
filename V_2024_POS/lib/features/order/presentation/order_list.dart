import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:possystem/features/order/models/orderitem_model.dart';
import 'package:possystem/features/order/presentation/order_detail.dart';
import 'package:possystem/features/order/presentation/order_list_button.dart';
import 'package:possystem/shared/db_manager.dart';
import 'package:possystem/shared/utils/color_constants.dart';

class OrderList extends StatelessWidget {
  final OrderItemList orderItemCollection;
  final MySqlConnector _mySqlConnector = MySqlConnector();
  final Function(int) onStateUpdated; // 상태 변경을 부모에게 알려주는 콜백 함수

  OrderList({super.key, required this.orderItemCollection, required this.onStateUpdated});

  @override
  Widget build(BuildContext context) {
    final orderDtString = orderItemCollection.orders.orderDt; // String 값// "YYYY-MM-DD HH:mm" 형식으로 포맷// "2024-12-24 16:24" 부분만 가져옴
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
      decoration: BoxDecoration(
        color: menuBackGroundColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 5,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      constraints: const BoxConstraints(maxHeight: 376, maxWidth: 348), // 최대 높이 설정
      padding: const EdgeInsets.only(left: 19, right: 19, top: 26, bottom: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 주문 번호와 날짜
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('주문 번호: ${orderItemCollection.orders.orderNum}', style: const TextStyle(fontWeight: FontWeight.bold, color: menuTextColor, fontSize: 16)),
              Text(formattedDate, style: const TextStyle(fontWeight: FontWeight.bold, color: menuTextColor, fontSize: 16)),
            ],
          ),
          const Divider(
            color: tableColumnBackGroundColor,
          ),

          const Row(
            children: [
              Expanded(
                flex: 2, // 비율 맞추기 (제품명 넓게)
                child: Text('제품명', style: TextStyle(fontWeight: FontWeight.bold, color: tableDeleteRowColor, fontSize: 14)),
              ),
              Expanded(
                flex: 1, // 비율 맞추기 (개수 좁게)
                child: Text('개수', style: TextStyle(fontWeight: FontWeight.bold, color: tableDeleteRowColor, fontSize: 14), textAlign: TextAlign.center),
              ),
              Expanded(
                flex: 1, // 비율 맞추기 (가격 좁게)
                child: Text('가격', style: TextStyle(fontWeight: FontWeight.bold, color: tableDeleteRowColor, fontSize: 14), textAlign: TextAlign.right),
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
                            style: const TextStyle(color: menuTextColor, fontSize: 14),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6.0), // 행 간 여백 추가
                          child: Text(
                            '${orderItem['quantity'] ?? 0}개',
                            textAlign: TextAlign.center,
                            style: const TextStyle(color: menuTextColor, fontSize: 14),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6.0), // 행 간 여백 추가
                          child: Text(
                            '${orderItem['prdPrice'] ?? 0}원',
                            textAlign: TextAlign.right,
                            style: const TextStyle(color: menuTextColor, fontSize: 14),
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
              const Text('합계: ', style: TextStyle(fontWeight: FontWeight.bold, color: menuTextColor, fontSize: 16)),
              const Spacer(),
              Text('${orderItemCollection.orders.orderPrice}원', style: const TextStyle(fontWeight: FontWeight.bold, color: menuTextColor, fontSize: 16)),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              OrderListButton(
                buttonText: "자세히",
                cornerRadius: 6.0,
                buttonBackGroundColor: buttonAllDeleteBackGround,
                buttonTextColor: buttonAllDelete,
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                    ),
                    builder: (BuildContext context) {
                      return FractionallySizedBox(
                        heightFactor: 0.8, // 화면 높이의 80%
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              OrderDetail(orderItemCollection: orderItemCollection),
                              const SizedBox(height: 10),
                              ElevatedButton(
                                onPressed: () {
                                  // 오류의 원인은 Navigator.of(context).pop()이 void를 반환하는데, 이를 onPressed 콜백 함수의 본문으로 직접 작성하지 않고 함수 호출 결과를 전달하려고 했기 때문
                                  Navigator.of(context).pop();
                                },
                                style: ElevatedButton.styleFrom(
                                  fixedSize: const Size(250, 49),
                                  backgroundColor: buttonAllDeleteBackGround,
                                  padding: EdgeInsets.zero,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  elevation: 0,
                                ),
                                child: const Text(
                                  '창 닫기',
                                  style: TextStyle(fontWeight: FontWeight.w600, color: menuTextColor, fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
              const SizedBox(
                width: 12,
              ),
              if (orderItemCollection.orders.orderState == '0')
                OrderListButton(
                  buttonText: "결제완료",
                  cornerRadius: 6.0,
                  buttonBackGroundColor: buttonOrderBackGround, // 결제완료 상태 색상
                  buttonTextColor: buttonOrder,
                  onPressed: () {
                    // 주문 상태 업데이트 후 부모에게 알림
                    _mySqlConnector.ordersStateDataUpdate(int.parse(orderItemCollection.orders.ordIdx ?? '1')).then((_) {
                      // 상태 변경 후 부모에게 알리기
                      onStateUpdated(int.parse(orderItemCollection.orders.ordIdx ?? '1'));
                    });
                  },
                ),
            ],
          ),
        ],
      ),
    );
  }
}
