import 'package:flutter/material.dart';
import 'package:possystem/View/Color/colors.dart';

class HomeviewOrederbuttonView extends StatelessWidget {
  final String buttonText; // 버튼 텍스트
  final double cornerRadius; // 곡률
  final Color buttonBackGroundColor; // 버튼 배경 색깔
  final Color buttonTextColor; // 버튼 텍스트 색깔

  const HomeviewOrederbuttonView({
    super.key,
    required this.buttonText, // 생성자에서 텍스트를 받음
    required this.cornerRadius, // 생성자에서 곡률을 받음
    required this.buttonBackGroundColor, // 생성자에서 배경 색을 받음
    required this.buttonTextColor // 생성자에서 텍스트 색을 받음
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(251, 57),
        backgroundColor: buttonBackGroundColor,
        padding: EdgeInsets.zero, // 패딩 0으로 설정 기본 값이 너무 크게 설정되어 있음.
        shape: RoundedRectangleBorder( // Border 설정
          borderRadius: BorderRadius.circular(cornerRadius), // 사각형 버튼
        ),
        elevation: 0, // 그림자 제거
      ), 
      // 버튼 내 텍스트
      child: Text(buttonText,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: buttonTextColor,
        ),
      ),
    );
  }
}