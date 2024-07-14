import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:possystem/View/Color/colors.dart';


class HomeViewMenuCell extends StatelessWidget {
  const HomeViewMenuCell({Key? key}) : super(key: key);

  static const double corner_radius = 13;
  static const String font_familly = 'Inter';

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
              borderRadius: BorderRadius.circular(corner_radius), // 사각형 버튼
            ),
          ),  // styleForm
          child: const Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(corner_radius), // 상단 왼쪽 곡률
                  topRight: Radius.circular(corner_radius), // 상단 오른쪽 곡률
                ),
                child: Image(
                  image: AssetImage("assets/images/꽈배기.jpg"), // 이미지 에셋 호출
                  height: 102, // 높이 102
                  fit: BoxFit.fitWidth, // 그림 크기 가로 맞추기
                ),
              ),
              Spacer(),
              Text('꽈배기',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: font_familly,
                  fontWeight: FontWeight.w600,
                  color: menuTextColor,
                ),
              ),
              Spacer()
            ]
          ),
        ),
      ),
    );
  }
}