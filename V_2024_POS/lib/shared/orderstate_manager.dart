import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:possystem/shared/db_manager.dart';

class OrderStateManager extends ChangeNotifier {
  final MySqlConnector _mySqlConnector = MySqlConnector();

  late Map<String?, Map<String, dynamic>> orders;
  List<Map<String, dynamic>> orderDatas = [];

  List<bool> orderCompleteExistence = [true, false, false];

  Future<void> updateOrderState(int index) async {
    // 상태 변경
    for (int i = 0; i < orderCompleteExistence.length; i++) {
      orderCompleteExistence[i] = (i == index);
    }

    orders = await _mySqlConnector.ordersDataToday();

    // 데이터 불러오기
    if (index == 0) {
      orderDatas = await _mySqlConnector.ordersAllData();
    } else if (index == 1) {
      orderDatas = await _mySqlConnector.ordersStateData(0);
    } else {
      orderDatas = await _mySqlConnector.ordersStateData(1);
    }

    notifyListeners(); // 상태가 바뀌었음을 알림
  }
}
