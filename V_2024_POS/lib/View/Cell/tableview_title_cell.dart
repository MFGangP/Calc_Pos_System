import 'package:flutter/material.dart';
import 'package:possystem/View/Color/colors.dart';

class HomeViewTableTitle extends StatelessWidget {
  final double containerWidth;
  final double containerHeight;
  final String containerTitle;

  const HomeViewTableTitle({
    super.key,
    required this.containerWidth,
    required this.containerHeight,
    required this.containerTitle,
  });

  static const double cornerRadius = 13;

  Color _getTextColor() {
    if (containerTitle == '삭제') {
      return tableDeleteRowColor;
    } else {
      return menuTextColor; // 기본 색상
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: containerWidth,
      height: containerHeight,
      decoration: const ShapeDecoration(
        color: tableColumnBackGroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(cornerRadius),
            topRight: Radius.circular(cornerRadius),
          ),
        ),
      ),
      alignment: Alignment.center,
        child: Text(
          containerTitle,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: _getTextColor(),
        ),
      ),
    );
  }
}
