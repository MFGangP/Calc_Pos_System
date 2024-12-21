import 'package:flutter/material.dart';
import 'package:possystem/shared/db_manager.dart';

class OrderStateManager extends ChangeNotifier {
  final MySqlConnector _mySqlConnector = MySqlConnector();

  List<Map<String, dynamic>> orders = [];
  List<bool> orderCompleteExistence = [true, false, false];

  Future<void> updateOrderState(int index) async {
    // 상태 변경
    for (int i = 0; i < orderCompleteExistence.length; i++) {
      orderCompleteExistence[i] = (i == index);
    }

    // 데이터 불러오기
    if (index == 0) {
      orders = await _mySqlConnector.ordersAllData();
    } else if (index == 1) {
      orders = await _mySqlConnector.ordersStateData(0);
    } else {
      orders = await _mySqlConnector.ordersStateData(1);
    }

    notifyListeners(); // 상태가 바뀌었음을 알림
  }
}
