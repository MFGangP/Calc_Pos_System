import 'package:flutter/material.dart';
import 'package:possystem/shared/utils/color_constants.dart';

class MenuButton extends StatelessWidget {
  final String menuName; // 메뉴 이름
  final VoidCallback onPressed; // 클릭 시 동작 (MenuManager와 연결된 동작)

  const MenuButton({
    super.key,
    required this.menuName,
    required this.onPressed,
  });

  static const double cornerRadius = 13;
  static const String imagePathPrefix = "assets/images/";

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 135,
      height: 135,
      child: ElevatedButton(
        onPressed: onPressed, // MenuManager로 데이터 업데이트를 요청
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(135, 135),
          backgroundColor: menuBackGroundColor,
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(cornerRadius),
          ),
          elevation: 0,
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(cornerRadius),
                topRight: Radius.circular(cornerRadius),
              ),
              child: Image(
                image: AssetImage('$imagePathPrefix$menuName.jpg'),
                height: 102,
                width: 135,
                fit: BoxFit.fitWidth,
              ),
            ),
            const Spacer(),
            Text(
              menuName,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: menuTextColor,
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
