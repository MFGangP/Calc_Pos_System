import 'package:flutter/material.dart';
import 'package:possystem/features/order/models/orderitem_model.dart';
import 'package:possystem/features/order/presentation/order_detail.dart';
import 'package:possystem/features/order/data/orderstate_manager.dart';

class OrderList extends StatefulWidget {
  const OrderList({super.key});

  @override
  _OrderListState createState() => _OrderListState(); // createState 구현
}

class _OrderListState extends State<OrderList> {
  final OrderStateManager _orderItemCollectionManager = OrderStateManager();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<OrderItemList>>(
      future: _orderItemCollectionManager.orderDatas, // 비동기 데이터를 가져옵니다.
      builder: (context, snapshot) {
        // 로딩 중일 때
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        // 에러가 있을 때
        else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error.toString()}')); // 에러 메시지 처리
        }
        // 데이터가 없거나 비어있을 때
        else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No orders available'));
        }

        // 데이터를 가져오면 GridView를 표시
        List<OrderItemList> orderList = snapshot.data!; // 데이터를 List로 변환

        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // 가로에 표시할 아이템 수
            crossAxisSpacing: 34.0, // 가로 간격
            mainAxisSpacing: 33.0, // 세로 간격
          ),
          itemCount: _orderItemCollectionManager.orderDataLength, // 데이터의 길이만큼 반복
          itemBuilder: (context, index) {
            // OrderDetail에 데이터를 전달
            return OrderDetail(orderItemCollection: orderList[index]);
          },
        );
      },
    );
  }
}
