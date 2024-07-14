import 'package:flutter/material.dart';
import 'package:possystem/Model/db_manager.dart';

class PosChartView extends StatelessWidget {
  const PosChartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Third Route'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Third Route'),
          onPressed: () {
            // Navigate to second route when tapped.
          },
        ),
      ),
    );
  }
}