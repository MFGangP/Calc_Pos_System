import 'package:flutter/material.dart';
import 'package:possystem/features/order/models/orderitem_model.dart';
import 'package:possystem/shared/utils/color_constants.dart';

class OrderDetail extends StatelessWidget {
  final OrderItemCollection orderItemCollection;

  const OrderDetail({super.key, required this.orderItemCollection});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

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
      width: screenWidth * 0.25, // 화면 크기에 비례하여 설정
      height: 376,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 주문 번호와 날짜
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('주문 번호: ${orderItemCollection.orders.ordIdx}', style: const TextStyle(fontWeight: FontWeight.bold)),
              Text('${orderItemCollection.orders.orderDt}', style: const TextStyle(color: tableDeleteRowColor)),
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
              shrinkWrap: true,
              itemCount: orderItemCollection.orderItem.length,
              itemBuilder: (context, index) {
                final orderItem = orderItemCollection.orderItem[index];
                if (index >= 1) {}
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('${orderItem.prdName}'),
                    Text('${orderItem.quantity}개'),
                    Text('${orderItem.prdPrice}원'),
                  ],
                );
              },
            ),
          ),

          const Divider(),

          // 합계 및 버튼
          Text('합계: ${orderItemCollection.orders.orderPrice}}원', style: const TextStyle(fontWeight: FontWeight.bold)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: const Text('자세히'),
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text('결제 완료'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
