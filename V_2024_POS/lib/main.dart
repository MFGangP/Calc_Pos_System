import 'package:flutter/material.dart';
import 'package:mysql_client/mysql_client.dart';
import 'package:possystem/Model/db_connector.dart';
import 'package:possystem/View/pos_menu_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: PosMenuView(), // posMenuView를 호출합니다.
    );
  }
}