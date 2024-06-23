import 'package:flutter/material.dart';
import 'package:mysql_client/mysql_client.dart';
import 'package:possystem/Model/DBConnector.dart';
import 'package:possystem/View/POS_Menu_View.dart';

var products = {};


void main() {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'name',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
