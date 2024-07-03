import 'package:flutter/material.dart';
import 'package:possystem/View/pos_order_view.dart';
import 'package:possystem/View/pos_chart_view.dart';
import 'package:possystem/View/pos_home_view.dart';
import 'package:possystem/View/pos_setting_view.dart';

class PosMenuView extends StatelessWidget {
  const PosMenuView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: 76,
        height: 720,
        child: Column (
          children: [
            _buildMenuIcon(Icons.home, Colors.orange),
            _buildMenuIcon(Icons.format_list_bulleted, Colors.grey),
            _buildMenuIcon(Icons.ssid_chart, Colors.grey),
            const Spacer(),
            _buildMenuIcon(Icons.settings, Colors.grey)
          ],
        ),
      )
    );
  }

  Widget _buildMenuIcon(IconData menuIcon, Color menuColor) {
    return TextButton(
      onPressed: () {
        Navigator.push(
          context, 
          MaterialPageRoute(builder: (context) => const PosChartView())
      },
      child: Container(
        width: 52,
        height: 52,
        alignment: Alignment.center,
        child: Icon(
          menuIcon,
          color: menuColor,
          size: 40.0,
        ),
      ),
    );
  }
}