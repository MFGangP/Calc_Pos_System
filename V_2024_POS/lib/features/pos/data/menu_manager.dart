class MenuManager {
  final List<MenuRowData> _tableContentList = [];

  // 테이블 데이터 반환
  List<MenuRowData> getTableContentList() =>
      List.unmodifiable(_tableContentList);

  // DataRow 추가/수정 로직
  void addOrUpdateMenuRow(String menuName, int menuPrice, bool countingBool) {
    final existingRowIndex = _tableContentList.indexWhere(
      (row) => row.menuName == menuName,
    );

    if (existingRowIndex != -1) {
      final existingRow = _tableContentList[existingRowIndex];
      if (countingBool) {
        existingRow.menuCount += 1; // 수량 증가
      } else if (existingRow.menuCount > 1) {
        existingRow.menuCount -= 1; // 수량 감소
      }
    } else {
      _tableContentList.add(MenuRowData(menuName, menuPrice, 1));
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
              'name': row.menuName,
              'price': row.menuPrice,
              'count': row.menuCount,
            })
        .toList();
  }
}

// 개별 행의 데이터 클래스
class MenuRowData {
  final String menuName;
  final int menuPrice;
  int menuCount;

  MenuRowData(this.menuName, this.menuPrice, this.menuCount);

  int get totalCost => menuPrice * menuCount;
}
