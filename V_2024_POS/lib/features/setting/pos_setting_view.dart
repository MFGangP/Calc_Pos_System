import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:possystem/shared/db_manager.dart';
import 'package:possystem/features/setting/data/menu_edit_manager.dart';
import 'package:possystem/shared/utils/color_constants.dart';
import 'package:possystem/features/home/presentation/menu_button.dart';
import 'package:possystem/features/home/presentation/order_button.dart';

class PosSettingView extends StatefulWidget {
  const PosSettingView({super.key});

  @override
  _PosSettingViewState createState() => _PosSettingViewState();
}

class _PosSettingViewState extends State<PosSettingView> {
  final MySqlConnector _mySqlConnector = MySqlConnector();
  final MenuEditManager _menuEditManager = MenuEditManager();
  late Future<List<Map<String, String?>>> _productsFuture;

  final String _nameTextField = '제품명을 입력해주세요';
  final String _priceTextField = '제품 가격을 입력해주세요';

  String _idxController = '';
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  // @override
  // void dispose() {
  //   _nameController.dispose();
  //   _priceController.dispose();
  //   super.dispose();
  // }

  @override
  void initState() {
    super.initState();
    _productsFuture = _loadProductData(); // 초기화 추가
  }

  Future<List<Map<String, String?>>> _loadProductData() async {
    try {
      return await _mySqlConnector.productsData();
    } catch (error) {
      debugPrint("Error fetching products: $error");
      return [];
    }
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
                                                  _idxController = productList[j]['prdIdx'] ?? '';
                                                  _nameController.text = productList[j]['prdName'] ?? '제품명이 없습니다.';
                                                  _priceController.text = productList[j]['prdPrice'] ?? '제품 가격이 없습니다.';
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
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SafeArea(
                child: Container(
                  height: 24,
                ),
              ),
              const Text(
                '제품명',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 24, color: menuTextColor, fontWeight: FontWeight.w600),
              ),
              TextField(
                controller: _nameController,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                textAlign: TextAlign.left,
                decoration: InputDecoration(
                  hintStyle: const TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                  hintText: _nameTextField,
                ),
              ),
              const SizedBox(height: 35),
              const Text(
                '가격',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 24, color: menuTextColor, fontWeight: FontWeight.w600),
              ),
              TextField(
                controller: _priceController,
                keyboardType: TextInputType.number, // 숫자 키보드 사용
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly, // 숫자만 허용
                ],
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                textAlign: TextAlign.left,
                decoration: InputDecoration(
                  hintStyle: const TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                  hintText: _priceTextField,
                ),
              ),
              const SizedBox(height: 35),
              CustomButton(
                buttonText: '수정',
                cornerRadius: 10,
                buttonBackGroundColor: buttonOrderBackGround,
                buttonTextColor: buttonOrder,
                onPressed: () {
                  _menuEditManager.insertMenuProductDB(_idxController, _nameController.text, _priceController.text).then((result) {
                    if (result) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('수정 성공'),
                            content: const Text('제품이 수정되었습니다.'),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.of(context).pop(),
                                child: const Text('확인'),
                              ),
                            ],
                          );
                        },
                      );
                    } else {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('수정 실패'),
                            content: const Text('업데이트 중 문제가 발생했습니다. 다시 시도해주세요.'),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.of(context).pop(),
                                child: const Text('확인'),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  });
                },
              ),
              const Spacer()
            ],
          )),
          const SizedBox(width: 35),
        ],
      ),
    );
  }
}
