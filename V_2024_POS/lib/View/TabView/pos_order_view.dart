import 'package:flutter/material.dart';
import 'package:possystem/Model/db_manager.dart';

class PosOrderView extends StatelessWidget {
  const PosOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Route'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Second route'),
          onPressed: () {
            // Navigate to second route when tapped.
          },
        ),
      ),
    );
  }
}