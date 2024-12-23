import 'package:flutter/material.dart';
import 'package:possystem/features/order/presentation/order_detail.dart';
import 'package:possystem/shared/db_manager.dart';
import 'package:possystem/shared/orderstate_manager.dart';

class OrderList extends StatefulWidget {
  const OrderList({super.key});

  @override
  _OrderListState createState() => _OrderListState(); // createState 구현
}

class _OrderListState extends State<OrderList> {
  final OrderStateManager _orderStateManager = OrderStateManager();
  final MySqlConnector _mySqlConnector = MySqlConnector();
  int _correntOrderIndex = 0;
  
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, // 가로에 표시할 아이템 수
        crossAxisSpacing: 10.0, // 가로 간격
        mainAxisSpacing: 10.0, // 세로 간격
        childAspectRatio: 1.0, // 아이템의 가로:세로 비율
      ),
      // 오늘의 주문 기록 갯수만큼 반복 1~x까지지
      itemCount: _orderStateManager.orders.length,
      itemBuilder: (context, index) {
        _correntOrderIndex = index;
        for (int orderIndex = index; orderIndex < _orderStateManager.orderDatas[index]['orderIdx']; orderIndex++) {
          if(_orderStateManager.orderDatas[index]['orderIdx'] == orderIndex){
            const OrderList();
          }
        }
      },
    );
  }
}
