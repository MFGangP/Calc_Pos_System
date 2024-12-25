import 'package:flutter/material.dart';
import 'package:possystem/features/order/models/orderitem_model.dart';
import 'package:possystem/shared/db_manager.dart';

class OrderItemCollectionManager {
  final MySqlConnector _mySqlConnector = MySqlConnector();

  // 주문 데이터와 아이템 데이터를 저장할 리스트
  final List<OrderItemList> _orderItemListContent = [];

  Future<List<OrderItemList>> _fetchOrderData(Future<List<Map<String, dynamic>>> Function() fetchMethod) async {
    _orderItemListContent.clear(); // 기존 데이터를 초기화

    // 데이터 불러오기
    final orderList = await fetchMethod();

    // 데이터 변환 및 추가
    await Future.forEach(orderList, (order) async {
      _orderItemListContent.add(
        OrderItemList(
          orders: Orders(
            ordIdx: order['ordIdx']?.toString() ?? 'null',
            orderDt: order['orderDt']?.toString() ?? 'null',
            orderPrice: order['orderPrice']?.toString() ?? 'null',
            orderNum: order['orderNum']?.toString() ?? 'null',
            orderState: order['orderState']?.toString() ?? 'null',
          ),
          orderItem: await _mySqlConnector.ordersNumData(int.parse(order['orderNum']?.toString() ?? '1')),
        ),
      );

      debugPrint('주문 정보 하나씩 받아오는 로그 : $order');
    });
    return _orderItemListContent;
  }

  Future<List<OrderItemList>> orderItemListCollector() {
    return _fetchOrderData(() => _mySqlConnector.ordersDataToday());
  }

  Future<List<OrderItemList>> orderItemStateListCollector(int orderState) {
    return _fetchOrderData(() => _mySqlConnector.ordersStateDataToday(orderState));
  }
}
