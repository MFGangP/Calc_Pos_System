import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:possystem/features/pos/data/db_manager.dart';
import 'package:possystem/features/pos/presentation/pos_home_view/components/menu_button.dart';
import 'package:possystem/features/pos/presentation/pos_home_view/components/order_button.dart';
import 'package:possystem/features/pos/presentation/pos_home_view/components/table_title.dart';
import 'package:possystem/shared/utils/color_constants.dart';

class PosHomeView extends StatefulWidget {
  const PosHomeView({super.key});

  @override
  _PosHomeViewState createState() => _PosHomeViewState();
}

class _PosHomeViewState extends State<PosHomeView> {
  static const double cornerRadius = 13;
  static const double datatableheight = 483;
  static const double datatablewidth = 522;

  List<DataRow> tableContentList = [];
  Future<List<Map<String, String?>>> products =
      MySqlConnector().productsInitDB();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: mainBackGroundColor,
      child: Row(
        children: <Widget>[
          const SizedBox(width: 16),
          Column(
            children: [
              Container(
                height: 30,
              ),
              FutureBuilder<List<Map<String, String?>>>(
                future: products,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData && snapshot.data != null) {
                      List<Map<String, String?>> productList = snapshot.data!;
                      if (productList.isNotEmpty) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            for (int i = 0; i < productList.length; i += 4)
                              Padding(
                                // 세로 여백
                                padding: const EdgeInsets.only(bottom: 25),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    // 행이 4개 될 때마다 줄 바꿈
                                    for (int j = i;
                                        j < i + 4 && j < productList.length;
                                        j++) ...[
                                      GestureDetector(
                                        onTap: () {
                                          print('HomeViewMenuButton tapped');
                                        },
                                        child: Padding(
                                          // 가로 여백
                                          padding:
                                              const EdgeInsets.only(right: 10),
                                          child: HomeViewMenuButton(
                                            menuName: productList[j]
                                                    ['prdName'] ??
                                                'No Name',
                                            menuPrice: int.parse(
                                                productList[j]['prdPrice']!),
                                            onMenuCountChanged:
                                                (String menuName, int menuPrice,
                                                    int menuCount) {
                                              addOrUpdateMenuRow(menuName,
                                                  menuPrice, menuCount, true);
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ],
                                ),
                              ),
                          ],
                        );
                      } else {
                        return const Center(child: Text("데이터가 없습니다."));
                      }
                    }
                  }
                  if (snapshot.hasError) {
                    return Center(child: Text("Error: ${snapshot.error}"));
                  }
                  return const Center(child: Text("데이터를 불러올 수 없습니다."));
                },
              ),
            ],
          ),
          const SizedBox(width: 16),
          // DataTable 제목 행
          Column(
            children: [
              SafeArea(
                child: Container(
                  height: 30,
                ),
              ),
              const Row(
                children: [
                  HomeViewTableTitle(
                    containerWidth: 60,
                    containerTitle: '삭제',
                  ),
                  HomeViewTableTitle(
                    containerWidth: 230,
                    containerTitle: '제품명',
                  ),
                  HomeViewTableTitle(
                    containerWidth: 100,
                    containerTitle: '총 가격',
                  ),
                  HomeViewTableTitle(
                    containerWidth: 132,
                    containerTitle: '주문 수량',
                  )
                ],
              ),
              Container(
                height: datatableheight,
                width: datatablewidth,
                color: tableBackGroundColor,
                child: SingleChildScrollView(
                  child: DataTable(
                    dataRowColor:
                        WidgetStateProperty.all<Color>(tableBackGroundColor),
                    horizontalMargin: 0,
                    dividerThickness: 0,
                    columnSpacing: 0,
                    headingRowHeight: 0,
                    columns: const [
                      DataColumn(
                          label: SizedBox(
                        width: 60,
                        child: Text(""),
                      )),
                      DataColumn(
                          label: SizedBox(
                        width: 230,
                        child: Text(""),
                      )),
                      DataColumn(
                          label: SizedBox(
                        width: 100,
                        child: Text(""),
                      )),
                      DataColumn(
                          label: SizedBox(
                        width: 132,
                        child: Text(""),
                      )),
                    ],
                    rows: tableContentList,
                  ),
                ),
              ),
              // 합계 계산
              Column(
                children: [
                  Container(
                    height: 1,
                    width: datatablewidth,
                    decoration: const BoxDecoration(
                      color: tableBackGroundColor,
                    ),
                    child: const Divider(
                      height: 2,
                      indent: 15,
                      endIndent: 15,
                      color: tableTotalCostColor,
                    ),
                  ),
                  Container(
                    height: 60,
                    width: datatablewidth,
                    decoration: const BoxDecoration(
                      color: tableBackGroundColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(cornerRadius),
                        bottomRight: Radius.circular(cornerRadius),
                      ),
                    ),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 18,
                        ),
                        const Text(
                          "합계",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: tableTotalCostColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          "${calculateTotalCost()}원",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: tableTotalCostColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 34,
                          ),
                        ),
                        const SizedBox(
                          width: 18,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SafeArea(
                  child: Container(
                height: 20,
              )),
              Row(
                children: [
                  CustomButton(
                    buttonText: "전체 삭제",
                    cornerRadius: 8.0,
                    buttonBackGroundColor: buttonAllDeleteBackGround,
                    buttonTextColor: buttonAllDelete,
                    onPressed: () {
                      tableContentList.clear(); // 전체 삭제 로직
                    },
                  ),
                  const SizedBox(
                    width: 36,
                  ),
                  CustomButton(
                    buttonText: "전체 주문",
                    cornerRadius: 8.0,
                    buttonBackGroundColor: buttonOrderBackGround,
                    buttonTextColor: buttonOrder,
                    onPressed: () {
                      // 주문 처리 로직
                      List<Map<String, String?>> orderList = [];
                      for (var row in tableContentList) {
                        final cells = row.cells;
                        final menuPriceText = (cells[2].child as Text).data!;
                        final menuPrice =
                            int.parse(menuPriceText.replaceAll("원", ""));
                        orderList.add({
                          'name': (cells[0].child as Text).data!,
                          'price': menuPrice.toString(),
                        });
                      }
                      // DBManager에 orderList 전달
                    },
                  )
                ],
              ),
            ],
          ),
          const SizedBox(width: 16),
        ],
      ),
    );
  }

  // 데이터 Row 형식
  DataRow buildDataRow(String menuName, int menuPrice, int menuCount) {
    return DataRow(
      cells: [
        // 삭제
        DataCell(
          IconButton(
            onPressed: () {
              log('Delete!');
            },
            icon: const Icon(Icons.delete, color: tableDeleteRowColor),
          ),
        ),
        // 제품명
        DataCell(
          Text(
            menuName,
            style: const TextStyle(
              color: menuTextColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        // 총 가격
        DataCell(
          Text(
            "${menuPrice * menuCount}원",
            style: TextStyle(color: menuTextColor.withOpacity(0.6)),
          ),
        ),
        // 주문 수량
        DataCell(
          Row(
            children: [
              const SizedBox(width: 7),
              IconButton(
                onPressed: () {
                  setState(() {
                    addOrUpdateMenuRow(menuName, menuPrice, menuCount, false);
                  });
                },
                icon: const Icon(Icons.remove, color: buttonPlusMinus),
                style: IconButton.styleFrom(
                  backgroundColor: buttonPlusMinusBackGround,
                  minimumSize: const Size(40, 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(cornerRadius),
                  ),
                ),
              ),
              const Spacer(),
              Text(
                "$menuCount",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: menuTextColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {
                  // 수량을 1 증가시키고 다시 호출
                  setState(() {
                    addOrUpdateMenuRow(menuName, menuPrice, menuCount, true);
                  });
                },
                icon: const Icon(Icons.add, color: buttonPlusMinus),
                style: IconButton.styleFrom(
                  minimumSize: const Size(40, 40),
                  backgroundColor: buttonPlusMinusBackGround,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(cornerRadius),
                  ),
                ),
              ),
              const SizedBox(width: 7),
            ],
          ),
        ),
      ],
    );
  }

  // 클릭 시 DataRow를 생성하는 로직
  void addOrUpdateMenuRow(
      String menuName, int menuPrice, int menuCount, bool countingBool) {
    setState(() {
      // 항목이 이미 존재하는지 확인
      final existingRowIndex = tableContentList.indexWhere((row) {
        final cells = row.cells;
        return (cells[1].child as Text).data == menuName;
      });

      if (existingRowIndex != -1) {
        // 항목이 존재하면 menuCount 업데이트
        final existingRow = tableContentList[existingRowIndex];
        // Row의 자식 중에서 Text 위젯을 가져옴
        final rowWidget = existingRow.cells[3].child as Row;
        // 위젯의 데이터를 문자열에서 정수로 변환
        final menuCountText = rowWidget.children[3] as Text;
        // 메뉴 뷰의 메뉴 갯수 보다 1 증가한 (적용되어야 할) 현재 갯수
        final currentCount = int.parse(menuCountText.data!);
        if (countingBool == true) {
          // 수량이 변경된 경우에만 업데이트
          final updatedRow =
              buildDataRow(menuName, menuPrice, currentCount + 1);
          tableContentList[existingRowIndex] = updatedRow;
        }
        // 수량이 1보다 크면 1 감소시키고 다시 호출
        else if (countingBool == false && currentCount > 1) {
          // 수량이 변경된 경우에만 업데이트
          final updatedRow =
              buildDataRow(menuName, menuPrice, currentCount - 1);
          tableContentList[existingRowIndex] = updatedRow;
        }
      } else {
        // 항목이 없으면 새로 추가
        tableContentList.add(buildDataRow(menuName, menuPrice, menuCount));
      }
    });
  }

  // 총 가격을 계산하는 메서드
  int calculateTotalCost() {
    int totalCost = 0;
    for (var row in tableContentList) {
      final cells = row.cells;
      final menuPriceText = (cells[2].child as Text).data!;
      final menuPrice = int.parse(menuPriceText.replaceAll("원", ""));
      totalCost += menuPrice;
    }
    return totalCost;
  }
}
