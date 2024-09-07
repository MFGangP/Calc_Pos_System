import 'package:flutter/material.dart';
import 'package:possystem/Model/db_manager.dart';
import 'package:possystem/View/Component/homeview_menu_view.dart';
import 'package:possystem/View/Component/tableview_title_view.dart';
import 'package:possystem/View/Component/tableview_content_view.dart';
import 'package:possystem/View/Color/colors.dart';

class PosHomeView extends StatefulWidget {
  @override
  _PosHomeViewState createState() => _PosHomeViewState();
}

class _PosHomeViewState extends State<PosHomeView> {
  static const double cornerRadius = 13;
  static const double datatableheight = 483;
  static const double datatablewidth = 522;
  int menuCount = 0;
  Future<List<Map<String, String?>>> products = MySqlConnector().Products_initDB();

  // 메뉴 클릭 시 테이블에 행을 추가하는 메소드
  void addMenuRow(String menuName) {
    setState(() {
      // 테이블 행 추가 기능 구현
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: mainBackGroundColor,
      child: Row(
        children: <Widget>[
          // 좌측 여백
          const SizedBox(width: 16), // Spacer 대신 SizedBox로 간격 추가
          Column(
            children: [
              // 상단 여백
              SafeArea(
                  child: Container(
                    height: 30,
                  )
              ),
              FutureBuilder<List<Map<String, String?>>>(
                future: products, // 비동기 데이터
                builder: (context, snapshot) {
                  // 로딩 중일 때 로딩 표시
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  // 데이터 로드가 완료되었을 때
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData && snapshot.data != null) {
                      List<Map<String, String?>> productList = snapshot.data!;
                      if (productList.isNotEmpty) {
                        // 데이터가 있을 때 화면에 렌더링
                        return Column(
                           // 좌측 정렬을 위해 추가
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // 4개씩 묶어서 Row로 배치
                            for (int i = 0; i < productList.length; i += 4)
                              Padding(
                                 // Column 간 간격 추가
                                padding: const EdgeInsets.only(bottom: 22),
                                child: Row(
                                  // 좌측 정렬을 위해 MainAxisAlignment.start로 변경
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    for (int j = i; j < i + 4 && j < productList.length; j++) ...[
                                      GestureDetector(
                                        onTap: () {
                                          print('HomeViewMenuButton tapped');
                                        },
                                        child: Padding(
                                           // 각 아이템 간 간격 추가
                                          padding: const EdgeInsets.only(right: 22),
                                          child: HomeViewMenuButton(menuName: productList[j]['prdName'] ?? 'No Name'),
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
                    // 에러 발생 시 에러 메시지 표시
                    return Center(child: Text("Error: ${snapshot.error}"));
                  }
                  // 기본적으로 에러가 없고 데이터가 없으면 이 메시지를 반환
                  return const Center(child: Text("데이터를 불러올 수 없습니다."));
                },
              ),
            ],
          ),
          const SizedBox(width: 16), // Spacer 대신 SizedBox로 간격 추가
          Column(
            children: [
              SafeArea(
                  child: Container(
                    height: 30,
                  )
              ),
              // 스크롤 시에도 목록 타이틀 고정을 위한 Row
              const Row(
                children: [
                  HomeViewTableTitle(containerWidth: 60, containerTitle: '삭제',),
                  HomeViewTableTitle(containerWidth: 230, containerTitle: '제품명',),
                  HomeViewTableTitle(containerWidth: 100, containerTitle: '총 가격',),
                  HomeViewTableTitle(containerWidth: 132, containerTitle: '주문 수량',)
                ],
              ),
              // 크기와 배경색을 지정해주기 위해 컨테이너로 감싼다.
              Container(
                height: datatableheight, // 고정된 높이 설정
                width: datatablewidth, // 고정된 너비 설정
                color: tableBackGroundColor,
                child: SingleChildScrollView( // 행이 많아지면 스크롤 가능하게 처리
              
                  child: DataTable(
                    dataRowColor: WidgetStateProperty.all<Color>(tableBackGroundColor),
                    horizontalMargin: 0, // 전체 행 가로 마진 0
                    dividerThickness: 0, // Divider 굵기 0
                    columnSpacing: 0, // Column 간 간격 조절 0
                    headingRowHeight: 0, // 헤더 높이 조절 0 고정
                    columns: const [
                      // DataColumn 표시를 상단으로 뺐기 때문에 별도의 사이즈 선언을 해줘야함.
                        DataColumn(
                          label: SizedBox(
                            width: 60, 
                            child: Text(""),
                          ),
                        ),
                        DataColumn(
                          label: SizedBox(
                            width: 230,
                            child: Text(""),
                          ),
                        ),
                        DataColumn(
                          label: SizedBox(
                            width: 100,
                            child: Text(""),
                          ),
                        ),
                        DataColumn(
                          label: SizedBox(
                            width: 132,
                            child: Text(""),
                          ),
                        ),
                    ],
                    rows: [
                      // 만약 HomeViewMenuCell()이 눌려진다면 행이 하나씩 늘어나야 한다
                      HomeViewTableContent.createDataRow(),
                      HomeViewTableContent.createDataRow(),
                      HomeViewTableContent.createDataRow(),
                      HomeViewTableContent.createDataRow(),
                      HomeViewTableContent.createDataRow(),
                      HomeViewTableContent.createDataRow(),
                      HomeViewTableContent.createDataRow(),
                      HomeViewTableContent.createDataRow(),
                      HomeViewTableContent.createDataRow(),
                      HomeViewTableContent.createDataRow(),
                      HomeViewTableContent.createDataRow(),
                      HomeViewTableContent.createDataRow(),
                    ]
                  ),
                ),
              ),
              // 합계 표시
              Container(
                height: 62,
                width: datatablewidth, // 고정된 너비 설정
                decoration: const BoxDecoration(
                  color: tableBackGroundColor, // 전체 배경색
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(cornerRadius),
                    bottomRight: Radius.circular(cornerRadius)
                  ), // 모서리 곡률 적용
                ),
                child: const Row(
                  children: [
                    Text("합계"),
                    Text("62000원"),
                  ],
                ),
              ),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(251, 57),
                      backgroundColor: menuBackGroundColor, // 이미 menuBackGroundColor는 Color 객체
                      padding: EdgeInsets.zero, // 패딩 0으로 설정 기본 값이 너무 크게 설정되어 있음.
                      shape: RoundedRectangleBorder( // Border 설정
                        borderRadius: BorderRadius.circular(cornerRadius), // 사각형 버튼
                      ),
                    ), 
                    child: const Text("전체 삭제",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: buttonAllDelete,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 22,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(251, 57),
                      backgroundColor: buttonOrderBackGround, // 이미 menuBackGroundColor는 Color 객체
                      padding: EdgeInsets.zero, // 패딩 0으로 설정 기본 값이 너무 크게 설정되어 있음.
                      shape: RoundedRectangleBorder( // Border 설정
                        borderRadius: BorderRadius.circular(cornerRadius), // 사각형 버튼
                      ),
                    ), 
                    child: const Text("주문",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: buttonOrder,
                      ),
                    ),
                  ),
                  SafeArea(
                    child: Container(
                    height: 100,
                    )
                  )
                ],
              ),
            ],
          ),
          const SizedBox(width: 16), // Spacer 대신 SizedBox로 간격 추가
        ],
      )
    );
  }
}
