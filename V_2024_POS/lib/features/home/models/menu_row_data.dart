// 개별 행의 데이터 클래스
class MenuRowData {
  final String menuName;
  final int menuPrice;
  int menuCount;

  MenuRowData(this.menuName, this.menuPrice, this.menuCount);

  int get totalCost => menuPrice * menuCount;
}
