import 'package:flutter/material.dart';
import 'package:possystem/features/order/data/order_list_manager.dart';
import 'package:possystem/features/order/models/orderitem_model.dart';

class OrderStateManager extends ChangeNotifier {
  final OrderItemCollectionManager _orderItemCollectionManager = OrderItemCollectionManager();

  Map<String?, Map<String, dynamic>> orders = {};
  Future<List<OrderItemList>> orderDatas = Future.value([]); // 초기값으로 빈 리스트 할당

  int orderDataLength = 0;

  List<bool> orderCompleteExistence = [true, false, false];

  OrderStateManager() {
    // 초기화 시 기본 상태 로드
    updateOrderState(0);
  }

  Future<int> updateOrderState(int index) async {
    // 상태 변경
    for (int i = 0; i < orderCompleteExistence.length; i++) {
      orderCompleteExistence[i] = (i == index);
    }

    // 데이터 불러오기
    if (index == 0) {
      orderDatas = _orderItemCollectionManager.orderItemListCollector();
    } else if (index == 1) {
      orderDatas = _orderItemCollectionManager.orderItemStateListCollector(0);
    } else {
      orderDatas = _orderItemCollectionManager.orderItemStateListCollector(1);
    }
    // orderDatas가 Future<List<OrderItemList>> 타입이므로 await을 사용해 실제 데이터가 로드될 때까지 기다림
    List<OrderItemList> orderList = await orderDatas;
    // 데이터 길이 구하기
    orderDataLength = orderList.length;

    notifyListeners(); // 상태 변경 알림
    return orderDataLength;
  }
}
