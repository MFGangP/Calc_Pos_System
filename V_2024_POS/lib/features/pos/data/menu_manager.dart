// 개별 행의 데이터 클래스
import 'package:flutter/material.dart';

class MenuRowData {
  final String menuName;
  final int menuPrice;
  int menuCount;

  MenuRowData(this.menuName, this.menuPrice, this.menuCount);

  int get totalCost => menuPrice * menuCount;
}

class MenuManager {
  final List<MenuRowData> _tableContentList = [];

  // DataRow 추가/수정 로직
  void addAndUpdateMenuRow(String menuName, int menuPrice) {
    final existingRowIndex = _tableContentList.indexWhere(
      (row) => row.menuName == menuName,
    );

    if (existingRowIndex != -1) {
      final existingRow = _tableContentList[existingRowIndex];
      if (existingRow.menuCount > 0) {
        existingRow.menuCount += 1; // 수량 증가
      }
    } else {
      // 처음 등록되는 상황 일 때
      _tableContentList.add(MenuRowData(menuName, menuPrice, 1));
    }
  }

  // DataRow 감소/수정 로직
  void subtractAndUpdateMenuRow(String menuName, int menuPrice) {
    final existingRowIndex = _tableContentList.indexWhere(
      (row) => row.menuName == menuName,
    );
    if (existingRowIndex != -1) {
      final existingRow = _tableContentList[existingRowIndex];
      if (existingRow.menuCount > 1) {
        existingRow.menuCount -= 1;
      } else {
        debugPrint('더 이상 뺄셈이 불가능합니다.');
      }
    } else {
      debugPrint('뺄셈이 불가능합니다.');
    }
  }

  // 전체 삭제
  void clearTableContent() {
    _tableContentList.clear();
  }

  // 총 가격 계산
  int calculateTotalCost() {
    return _tableContentList.fold(0, (total, row) => total + row.totalCost);
  }

  // 주문 데이터 반환
  List<Map<String, dynamic>> getOrderList() {
    return _tableContentList
        .map((row) => {
              'prdName': row.menuName,
              'prdPrice': row.menuPrice,
              'prdCount': row.menuCount,
            })
        .toList();
  }
}
