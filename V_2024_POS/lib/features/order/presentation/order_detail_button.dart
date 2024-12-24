import 'package:flutter/material.dart';

class OrderDetailButton extends StatelessWidget {
  final String buttonText;
  final double cornerRadius;
  final Color buttonBackGroundColor;
  final Color buttonTextColor;
  final VoidCallback onPressed;

  const OrderDetailButton({
    super.key,
    required this.buttonText,
    required this.cornerRadius,
    required this.buttonBackGroundColor,
    required this.buttonTextColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(148, 43),
        backgroundColor: buttonBackGroundColor,
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(cornerRadius),
        ),
        elevation: 0,
      ),
      child: Text(
        buttonText,
        style: TextStyle(fontWeight: FontWeight.w600, color: buttonTextColor, fontSize: 16),
      ),
    );
  }
}
