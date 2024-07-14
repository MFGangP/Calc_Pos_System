import 'package:flutter/material.dart';
import 'package:possystem/Model/db_manager.dart';
import 'package:possystem/View/Cell/homeview_menu_cell.dart';

class PosHomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: <Widget>[
        SizedBox(
          width: 134.87,
          height: 134.88,
          child: HomeViewMenuCell(),
        ),
      ]
    );
  }
}