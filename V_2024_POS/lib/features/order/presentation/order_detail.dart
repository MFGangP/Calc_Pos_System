import 'package:flutter/material.dart';
import 'package:possystem/features/order/models/orderitem_model.dart';
import 'package:possystem/features/order/presentation/order_detail_button.dart';
import 'package:possystem/shared/utils/color_constants.dart';

class OrderDetail extends StatelessWidget {
  final OrderItemList orderItemCollection;

  const OrderDetail({super.key, required this.orderItemCollection});

  @override
  Widget build(BuildContext context) {
    final orderDtString = orderItemCollection.orders.orderDt; // String 값
    final formattedDate = orderDtString?.split('.').first; // "2024-12-24 16:24:00" 부분만 가져옴

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
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 주문 번호와 날짜
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('주문 번호: ${orderItemCollection.orders.orderNum}', style: const TextStyle(fontWeight: FontWeight.bold)),
              Text(formattedDate ?? '정보 없음', style: const TextStyle(color: tableDeleteRowColor)),
            ],
          ),
          const Divider(),

          // 제품명, 개수, 가격 헤더
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('제품명', style: TextStyle(fontWeight: FontWeight.bold)),
              Text('개수', style: TextStyle(fontWeight: FontWeight.bold)),
              Text('가격', style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),

          // 주문 아이템 리스트
          Expanded(
            child: ListView.builder(
              itemCount: orderItemCollection.orderItem.length,
              itemBuilder: (context, index) {
                final orderItem = orderItemCollection.orderItem[index];

                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(child: Text('${orderItem['prdName'] ?? '제품명 없음'}')),
                    Flexible(child: Text('${orderItem['quantity'] ?? 0}개')),
                    Flexible(child: Text('${orderItem['prdPrice'] ?? 0}원')),
                  ],
                );
              },
            ),
          ),

          const Divider(),

          // 합계 및 버튼
          Text('합계: ${orderItemCollection.orders.orderPrice}원', style: const TextStyle(fontWeight: FontWeight.bold)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Spacer(),
              OrderDetailButton(
                buttonText: "자세히",
                cornerRadius: 6.0,
                buttonBackGroundColor: buttonAllDeleteBackGround,
                buttonTextColor: buttonAllDelete,
                onPressed: () {},
              ),
              const SizedBox(
                width: 12,
              ),
              OrderDetailButton(
                buttonText: "결제완료",
                cornerRadius: 6.0,
                buttonBackGroundColor: buttonOrderBackGround,
                buttonTextColor: buttonOrder,
                onPressed: () {},
              ),
              const Spacer(),
            ],
          ),
        ],
      ),
    );
  }
}
