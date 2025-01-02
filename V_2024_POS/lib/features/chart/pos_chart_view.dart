import 'package:flutter/material.dart';
import 'package:possystem/shared/utils/color_constants.dart';

class PosChartView extends StatelessWidget {
  const PosChartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainBackGroundColor,
      body: Center(
        child: ElevatedButton(
          child: const Text('매출 분석 페이지 제작 중'),
          onPressed: () {
            // Navigate to second route when tapped.
          },
        ),
      ),
    );
  }
}
