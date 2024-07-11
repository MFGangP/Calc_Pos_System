import 'package:flutter/material.dart';
import 'package:possystem/View/pos_home_view.dart';
import 'package:possystem/View/pos_setting_view.dart';
import 'package:possystem/View/pos_order_view.dart';
import 'package:possystem/View/pos_chart_view.dart';

// 페이지 리스트로 한번에 불러오기위해 선언
class MenuList{
  final List<Widget> pages = [
    PosHomeView(),
    PosOrderView(),
    PosChartView(),
    PosSettingView(),
  ];
}
