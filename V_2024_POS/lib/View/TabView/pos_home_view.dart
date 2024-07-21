import 'package:flutter/material.dart';
import 'package:possystem/Model/db_manager.dart';
import 'package:possystem/View/Cell/homeview_menu_cell.dart';
import 'package:possystem/View/Cell/tableview_title_cell.dart';
import 'package:possystem/View/Cell/tableview_content_cell.dart';
import '../Color/colors.dart';

class PosHomeView extends StatelessWidget {

  static const double cornerRadius = 13;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
            Spacer(),
            Column(
              children: [
                SafeArea(
                    child: Container(
                      height: 30,
                    )
                ),
                Row(
                  children: [
                    Container(
                      width: 135,
                      height: 135,
                      child: HomeViewMenuCell(assetImagePath: "꽈배기.jpg",),
                    ),
                    Container(
                      width: 135,
                      height: 135,
                      child: HomeViewMenuCell(assetImagePath: "꽈배기.jpg",),
                    ),
                    Container(
                      width: 135,
                      height: 135,
                      child: HomeViewMenuCell(assetImagePath: "꽈배기.jpg",),
                    ),
                    Container(
                      width: 135,
                      height: 135,
                      child: HomeViewMenuCell(assetImagePath: "꽈배기.jpg",),
                    ),
                  ]
                ),
              ],
            ),
            Spacer(),
            Column(
              children: [
                SafeArea(
                    child: Container(
                      height: 30,
                    )
                ),
              DataTable(
                  horizontalMargin: 0, // 전체 행 가로 마진 0
                  dividerThickness: 0, // Divider 굵기 0
                  columnSpacing: 0, // Column 간 간격 조절 0
                  columns: const [
                    DataColumn(
                        label: HomeViewTableTitle(containerWidth: 60, containerHeight: 39, containerTitle: '삭제',)
                    ),
                    DataColumn(
                        label: HomeViewTableTitle(containerWidth: 230, containerHeight: 39, containerTitle: '제품명',)
                    ),
                    DataColumn(
                        label: HomeViewTableTitle(containerWidth: 100, containerHeight: 39, containerTitle: '총 가격',)
                    ),
                    DataColumn(
                        label: HomeViewTableTitle(containerWidth: 132, containerHeight: 39, containerTitle: '주문 수량',)
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
                  ]
                ),
                Row(
                  children: [
                    ElevatedButton(
                        onPressed: null,
                        style: ElevatedButton.styleFrom(
                        minimumSize: const Size(251, 57),
                        backgroundColor: menuBackGroundColor, // 이미 menuBackGroundColor는 Color 객체
                        padding: EdgeInsets.zero, // 패딩 0으로 설정 기본 값이 너무 크게 설정되어 있음.
                        shape: RoundedRectangleBorder( // Border 설정
                          borderRadius: BorderRadius.circular(20), // 사각형 버튼
                        ),
                      ), child: null,
                    ),
                    ElevatedButton(
                      onPressed: null,
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(251, 57),
                        backgroundColor: menuBackGroundColor, // 이미 menuBackGroundColor는 Color 객체
                        padding: EdgeInsets.zero, // 패딩 0으로 설정 기본 값이 너무 크게 설정되어 있음.
                        shape: RoundedRectangleBorder( // Border 설정
                          borderRadius: BorderRadius.circular(20), // 사각형 버튼
                        ),
                      ), child: null,
                    ),
                  ],
                ),
              ],
            ),
            Spacer()
          ],
    );
  }
}