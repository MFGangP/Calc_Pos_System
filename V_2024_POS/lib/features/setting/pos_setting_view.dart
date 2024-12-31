import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:possystem/shared/utils/color_constants.dart';
import 'package:possystem/shared/db_manager.dart';
import 'package:possystem/features/home/data/menu_manager.dart';
import 'package:possystem/features/home/presentation/menu_button.dart';
import 'package:possystem/features/home/presentation/order_button.dart';
import 'package:possystem/features/home/presentation/table_datarow.dart';
import 'package:possystem/features/home/presentation/table_title.dart';

class PosSettingView extends StatefulWidget {
  const PosSettingView({super.key});

  @override
  _PosSettingViewState createState() => _PosSettingViewState();
}

class _PosSettingViewState extends State<PosSettingView> {
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
                                                  // _menuManager.addAndUpdateMenuRow(productList[j]['prdName'] ?? 'No Name', int.parse(productList[j]['prdPrice'] ?? '0'));
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
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SafeArea(
                child: Container(
                  height: 30,
                ),
              ),
              const Text(
                '제품명',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 24, color: menuTextColor),
              ),
              const TextField(
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,
                decoration: InputDecoration(
                  hintText: '제품명을 입력해주세요',
                  border: OutlineInputBorder(), //외곽선
                ),
              ),
              const Text(
                '가격',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 24, color: menuTextColor),
              ),
              const TextField(
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.left,
                decoration: InputDecoration(
                  hintText: '제품 가격을 입력해주세요',
                  border: OutlineInputBorder(), //외곽선
                ),
              ),
              CustomButton(buttonText: '확인', cornerRadius: 10, buttonBackGroundColor: buttonOrderBackGround, buttonTextColor: buttonOrder, onPressed: () => {})
            ],
          )),
          const SizedBox(width: 35),
        ],
      ),
    );
  }
}
