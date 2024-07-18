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

  @override
  Widget build(BuildContext context) {
    return Container(
      width: containerWidth,
      height: containerHeight,
      decoration: ShapeDecoration(
        color: tableColumnBackGroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(cornerRadius),
            topRight: Radius.circular(cornerRadius),
          ),
        ),
      ),
      alignment: Alignment.center,
      child: Text(containerTitle),
    );
  }
}
