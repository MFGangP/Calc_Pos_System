import 'package:flutter/material.dart';
import 'package:possystem/Model/db_manager.dart';
import 'package:possystem/View/Cell/homeview_menu_cell.dart';
import 'package:possystem/View/Cell/tableview_title_cell.dart';
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
                Table(
                  border: TableBorder.all(),
                  columnWidths: const <int, TableColumnWidth>{
                    0: IntrinsicColumnWidth(),
                    1: IntrinsicColumnWidth(),
                    2: IntrinsicColumnWidth(),
                    3: IntrinsicColumnWidth(),
                  },
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  defaultColumnWidth: const FixedColumnWidth(10),
                  children: <TableRow>[
                    TableRow(
                      children: <Widget>[
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
                      ],
                    ),
                  ],
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
                    DataRow(
                      cells: [
                        DataCell(Text('철수')),
                        DataCell(Text('꽈배기')),
                        DataCell(Text('4000')),
                        DataCell(Text('1')),
                      ]
                    ),
                    DataRow(
                        cells: [
                          DataCell(Text('철수')),
                          DataCell(Text('꽈배기')),
                          DataCell(Text('4000')),
                          DataCell(Text('1')),
                        ]
                    ),
                  ]
                ),
                Row(
                  children: [
                    ElevatedButton(
                        onPressed: null,
                        child: Container(
                          color: Colors.red,
                        )
                    ),
                    ElevatedButton(
                        onPressed: null,
                        child: Container(
                          color: Colors.red,
                        )
                    )
                  ],
                ),
              ],
            ),
            Spacer()
          ],
    );
  }
}