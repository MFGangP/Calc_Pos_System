import 'package:flutter/material.dart';
import 'package:possystem/shared/utils/color_constants.dart';

class OrderStateButton extends StatelessWidget {
  final String buttonText;
  final double cornerRadius = 10;
  final double height = 44;
  final double width;
  final Color buttonBackGroundColor = menuBackGroundColor;
  final Color buttonTextColor = tableRowTextColor;
  final bool selectedButton;
  final VoidCallback onPressed;

  const OrderStateButton({
    super.key,
    required this.buttonText,
    required this.width,
    required this.selectedButton,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    Color textColor =
        selectedButton ? menuTextColor : buttonTextColor; // 선택되었을 때 텍스트 색

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(width, height),
        backgroundColor: buttonBackGroundColor,
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(cornerRadius),
        ),
        elevation: 0,
      ),
      child: Text(
        buttonText,
        style: TextStyle(
            fontWeight: FontWeight.bold, color: textColor, fontSize: 16),
      ),
    );
  }
}
