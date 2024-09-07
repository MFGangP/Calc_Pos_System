import 'package:flutter/material.dart';
import 'package:possystem/View/Color/colors.dart';

class HomeViewMenuCell extends StatelessWidget {
  final String assetImagePath; // 파일 이름을 위한 변수

  const HomeViewMenuCell({
    super.key,
    required this.assetImagePath, // 생성자에서 파일 이름을 받음
  });

  static const double cornerRadius = 13;
  static const String menuFont = 'Inter';
  static const String imagePathPrefix = "assets/images/"; // 고정된 경로

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 135,
      height: 135,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(135, 135),
          backgroundColor: menuBackGroundColor, // 이미 menuBackGroundColor는 Color 객체
          padding: EdgeInsets.zero, // 패딩 0으로 설정 기본 값이 너무 크게 설정되어 있음.
          shape: RoundedRectangleBorder( // Border 설정
            borderRadius: BorderRadius.circular(cornerRadius), // 사각형 버튼
          ),
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(cornerRadius), // 상단 왼쪽 곡률
                topRight: Radius.circular(cornerRadius), // 상단 오른쪽 곡률
              ),
              child: Image(
                // 상수 키워드를 제거하고 변수를 사용하여 이미지 경로를 동적으로 구성해야 함.
                image: AssetImage('$imagePathPrefix$assetImagePath'), // 이미지 경로와 파일 이름 조합
                height: 102, // 높이 102
                fit: BoxFit.fitWidth, // 그림 크기 가로 맞추기
              ),
            ),
            const Spacer(),
            const Text('꽈배기',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: menuFont,
                fontWeight: FontWeight.w600,
                color: menuTextColor,
              ),
            ),
            const Spacer()
          ],
        ),
      ),
    );
  }
}
