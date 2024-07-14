import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:possystem/View/Color/colors.dart';


class HomeViewMenuCell extends StatelessWidget {
  const HomeViewMenuCell({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(135, 135),
            backgroundColor: menuBackGroundColor, // 이미 menuBackGroundColor는 Color 객체
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(13), // 사각형 버튼
            ),
          ),  // styleForm
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: const Image(
                  image: AssetImage("assets/images/공룡알.jpg"),
                  height: 102,
                  fit: BoxFit.fitWidth,
                ),
              ),
              const Spacer(),
              const Text('Click Button',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: menuTextColor,
                ),
              ),
              const Spacer()
            ]
          ),
        ),
      ),
    );
  }
}