import 'package:flutter/material.dart';
import 'package:possystem/View/pos_home_view.dart';
import 'package:possystem/View/pos_setting_view.dart';
import 'package:possystem/View/pos_order_view.dart';
import 'package:possystem/View/pos_chart_view.dart';

class MenuList{
  final List<Widget> pages = [
    PosHomeView(),
    PosOrderView(),
    PosChartView(),
    PosSettingView(),
  ];
}
