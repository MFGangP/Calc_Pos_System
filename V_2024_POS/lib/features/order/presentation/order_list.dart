import 'package:flutter/material.dart';
import 'package:possystem/features/order/models/orderitem_model.dart';
import 'package:possystem/shared/utils/color_constants.dart';

class OrderDetail extends StatelessWidget {
  final String orderNumber;
  final String orderDate;
  final int totalPrice;
  final List<Map<String, dynamic>> orderItems; // 주문 아이템 리스트
  final VoidCallback onDetailPressed;
  final VoidCallback onCompletePressed;

  const OrderDetail({
    super.key,
    required this.orderNumber,
    required this.orderDate,
    required this.orderItems,
    required this.totalPrice,
    required this.onDetailPressed,
    required this.onCompletePressed,
  });

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
      width: screenWidth * 0.3, // 화면 크기에 비례하여 설정
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 주문 번호와 날짜
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('주문 번호: $orderNumber',
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              Text(orderDate,
                  style: const TextStyle(color: tableDeleteRowColor)),
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
              itemCount: orderItems.length,
              itemBuilder: (context, index) {
                final item = orderItems[index];
                if (index >= 1) {}
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('${item[index]['prdName']}'),
                    Text('${item[index]['quantity']}개'),
                    Text('${item[index]['totalPrice']}원'),
                  ],
                );
              },
            ),
          ),

          const Divider(),

          // 합계 및 버튼
          Text('합계: $totalPrice원',
              style: const TextStyle(fontWeight: FontWeight.bold)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: onDetailPressed,
                child: const Text('자세히'),
              ),
              ElevatedButton(
                onPressed: onCompletePressed,
                child: const Text('결제 완료'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
