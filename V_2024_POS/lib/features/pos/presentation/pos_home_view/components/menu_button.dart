import 'package:flutter/material.dart';
import 'package:possystem/shared/utils/color_constants.dart';

class HomeViewMenuButton extends StatefulWidget {
  final String menuName; // 메뉴 이름
  int menuPrice = 0; // 메뉴 가격
  int menuCount = 0; // 주문 개수 초기 값 0
  bool countingBool = true; // 계산 방식 체크를 위한 bool 타입
  final Function(String menuName, int menuPrice, int menuCount)
      onMenuCountChanged; // 콜백 함수

  HomeViewMenuButton(
      {super.key,
      required this.menuName,
      required this.menuPrice,
      required this.onMenuCountChanged});

  @override
  _HomeViewMenuButtonState createState() => _HomeViewMenuButtonState();
}

class _HomeViewMenuButtonState extends State<HomeViewMenuButton> {
  static const double cornerRadius = 13;
  static const String imagePathPrefix = "assets/images/";

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 135,
      height: 135,
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            widget.menuCount++; // 메뉴 개수 증가
            widget.onMenuCountChanged(widget.menuName,
                widget.menuPrice * widget.menuCount, widget.menuCount);
          });
        },
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
                image: AssetImage('$imagePathPrefix${widget.menuName}.jpg'),
                height: 102,
                width: 135,
                fit: BoxFit.fitWidth,
              ),
            ),
            const Spacer(),
            Text(
              widget.menuName,
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
