import 'package:flutter/material.dart';

class PosSettingView extends StatelessWidget {
  const PosSettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fourth Route'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Fourth route'),
          onPressed: () {
            // Navigate to second route when tapped.
          },
        ),
      ),
    );
  }
}