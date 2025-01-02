import 'package:flutter/material.dart';
import 'package:possystem/shared/utils/color_constants.dart';
import 'package:possystem/features/home/data/menu_manager.dart';

class DataRowCell {
  final MenuManager menuManager;
  final VoidCallback onUpdate; // 상태 변경 콜백 추가

  DataRowCell({required this.menuManager, required this.onUpdate});

  DataRow buildDataRow(String menuName, int menuPrice, int menuCount) {
    return DataRow(
      cells: [
        // 삭제
        DataCell(
          Align(
            alignment: Alignment.center,
            child: IconButton(
              onPressed: () {
                menuManager.deleteMenuRow(menuName);
                onUpdate();
              },
              icon: const Icon(Icons.delete, color: tableDeleteRowColor),
            ),
          ),
        ),
        // 제품명
        DataCell(
          Text(
            menuName,
            style: const TextStyle(
              color: menuTextColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        // 총 가격
        DataCell(
          Align(
            alignment: Alignment.center,
            child: Text(
              "${menuPrice * menuCount}원",
              style: TextStyle(color: menuTextColor.withOpacity(0.6)),
            ),
          ),
        ),
        // 주문 수량
        DataCell(
          Row(
            children: [
              const SizedBox(width: 7),
              IconButton(
                onPressed: () {
                  // 수량 1 감소
                  menuManager.subtractAndUpdateMenuRow(menuName, menuPrice);
                  onUpdate(); // 상태 갱신 요청
                },
                icon: const Icon(Icons.remove, color: buttonPlusMinus),
                style: IconButton.styleFrom(
                  backgroundColor: buttonPlusMinusBackGround,
                  minimumSize: const Size(40, 40),
                ),
              ),
              const Spacer(),
              Text(
                "$menuCount",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: menuTextColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {
                  // 수량 1 증가
                  menuManager.addAndUpdateMenuRow(menuName, menuPrice);
                  onUpdate(); // 상태 갱신 요청
                },
                icon: const Icon(Icons.add, color: buttonPlusMinus),
                style: IconButton.styleFrom(
                  minimumSize: const Size(40, 40),
                  backgroundColor: buttonPlusMinusBackGround,
                ),
              ),
              const SizedBox(width: 7)
            ],
          ),
        ),
      ],
    );
  }
}
