import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:possystem/shared/utils/color_constants.dart';
import 'package:possystem/shared/db_manager.dart';
import 'package:possystem/features/home/data/menu_manager.dart';
import 'package:possystem/features/home/presentation/menu_button.dart';
import 'package:possystem/features/home/presentation/order_button.dart';
import 'package:possystem/features/home/presentation/table_datarow.dart';
import 'package:possystem/features/home/presentation/table_title.dart';

class PosHomeView extends StatefulWidget {
  const PosHomeView({super.key});

  @override
  _PosHomeViewState createState() => _PosHomeViewState();
}

class _PosHomeViewState extends State<PosHomeView> {
  static const double _cornerRadius = 13;
  static const double _datatableheight = 483;
  static const double _datatablewidth = 522;

  final String _nowDate = DateFormat('yyyy-MM-dd').add_Hm().format(DateTime.now());

  final MenuManager _menuManager = MenuManager();
  final MySqlConnector _mySqlConnector = MySqlConnector();
  late final DataRowCell _dataRowCell; // DataRowCell 인스턴스 추가

  late Future<List<Map<String, String?>>> _productsFuture;

  @override
  void initState() {
    super.initState();
    _loadProductData();
  }

  Future<void> _loadProductData() async {
    _productsFuture = _mySqlConnector.productsData();

    // Future 완료 후 로딩 상태 업데이트
    _productsFuture.then((value) {
      _dataRowCell = DataRowCell(
        menuManager: _menuManager,
        onUpdate: () => setState(() {}), // 상태 변경 시 호출
      );
    }).catchError((error) {
      setState(() {});
      debugPrint("Error fetching products: $error");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: mainBackGroundColor,
      child: Row(
        children: <Widget>[
          const SizedBox(width: 35),
          Column(
            children: [
              Container(
                height: 30,
              ),
              Expanded(
                child: FutureBuilder<List<Map<String, String?>>>(
                  future: _productsFuture,
                  builder: (context, snapshot) {
                    // DB에서 불러오기가 완료되지 않았을 경우
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    // DB에서 불러오기가 완료되었을 경우
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
                                      for (int j = i; j < i + 4 && j < productList.length; j++) ...[
                                        GestureDetector(
                                          child: Padding(
                                            // 가로 여백
                                            padding: const EdgeInsets.only(right: 10),
                                            child: MenuButton(
                                              menuName: productList[j]['prdName'] ?? 'No Name',
                                              onPressed: () {
                                                setState(() {
                                                  _menuManager.addAndUpdateMenuRow(productList[j]['prdName'] ?? 'No Name', int.parse(productList[j]['prdPrice'] ?? '0'));
                                                });
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
                height: _datatableheight,
                width: _datatablewidth,
                color: tableBackGroundColor,
                child: SingleChildScrollView(
                  child: DataTable(
                    dataRowColor: WidgetStateProperty.all<Color>(tableBackGroundColor),
                    horizontalMargin: 0,
                    dividerThickness: 1,
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
                    rows: _menuManager.getOrderList().map((order) {
                      return _dataRowCell.buildDataRow(
                        order['prdName'] ?? '제작자 연락 요망 - 버그', // Null 체크 추가
                        order['prdPrice'] ?? 0, // Null 체크 및 기본값 0
                        order['prdCount'] ?? 1, // Null 체크 및 기본값 1
                      );
                    }).toList(),
                  ),
                ),
              ),
              // 합계 계산
              Column(
                children: [
                  Container(
                    height: 1,
                    width: _datatablewidth,
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
                    height: 69,
                    width: _datatablewidth,
                    decoration: const BoxDecoration(
                      color: tableBackGroundColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(_cornerRadius),
                        bottomRight: Radius.circular(_cornerRadius),
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
                          "${_menuManager.calculateTotalCost()}원",
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
              Expanded(
                child: Row(
                  children: [
                    CustomButton(
                      buttonText: "전체 삭제",
                      cornerRadius: 8.0,
                      buttonBackGroundColor: buttonAllDeleteBackGround,
                      buttonTextColor: buttonAllDelete,
                      onPressed: () {
                        setState(() {
                          _menuManager.clearTableContent();
                        });
                      },
                    ),
                    const SizedBox(
                      width: 35,
                    ),
                    CustomButton(
                      buttonText: "전체 주문",
                      cornerRadius: 8.0,
                      buttonBackGroundColor: buttonOrderBackGround,
                      buttonTextColor: buttonOrder,
                      onPressed: () {
                        if (_menuManager.calculateTotalCost() != 0) {
                          setState(() {
                            // debugPrint('${_menuManager.getOrderList()}');
                            _mySqlConnector.insertOrderData(_nowDate, _menuManager.calculateTotalCost(), _menuManager.getOrderList());
                            _menuManager.clearTableContent();
                          });
                          // DBManager에 orderList 전달
                        } else {
                          // 주문이 없을 경우 알림 다이얼로그 띄우기
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('주문 기록이 없습니다'),
                                content: const Text('주문을 추가한 후 다시 시도해주세요.'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop(); // 다이얼로그 닫기
                                    },
                                    child: const Text('확인'),
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
          const Spacer()
        ],
      ),
    );
  }
}
