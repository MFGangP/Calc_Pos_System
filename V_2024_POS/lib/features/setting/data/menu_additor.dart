import 'dart:async';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:possystem/shared/db_manager.dart';

class MenuAdditor {
  final List<Map<String, String?>> _tableContentList = [];
  final MySqlConnector _mySqlConnector = MySqlConnector();

  Future<bool> insertMenuProductDB(int prdIdx, String prdName, int prdPrice) async {
    try {
      // 비동기 작업 수행
      bool insertSucceeded = await _mySqlConnector.updateProductData(prdIdx, prdName, prdPrice);

      // 작업 성공 여부 반환
      return insertSucceeded;
    } catch (e) {
      // 오류 발생 시 false 반환
      print('Error while inserting product data: $e');
      return false;
    }
  }

  // 전체 삭제
  void clearTableContent() {
    _tableContentList.clear();
  }
}
