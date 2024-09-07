import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:possystem/View/Color/colors.dart';

class HomeViewTableContent{

  static const double cornerRadius = 20;

  static DataRow createDataRow() {
    return DataRow(
      // MaterialStateProperty<Color> 가 삭제되어 이렇게 사용해야함.
      color: WidgetStateProperty.all<Color>(tableBackGroundColor),
      cells: [
        DataCell(
          Center(
            child: IconButton(
              onPressed: () => {
                log('Delete!'),
              },
              icon: const Icon(
                Icons.delete,
                color: tableDeleteRowColor,
              ),
              style: IconButton.styleFrom(
                minimumSize: const Size(55, 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(cornerRadius),
                ),
              ),
            ),
          ),
        ),
        const DataCell(
          Text(
            '블루베리 아이스티',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: menuTextColor,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        DataCell(
          Center(
            child: Text(
              '4000' + '원',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: menuTextColor.withOpacity(0.6),
              ),
            ),
          ),
        ),
        DataCell(
          Row(
            children: [
              const SizedBox(
                width: 7,
              ),
              IconButton(
                onPressed: () => {
                  log('Minus 1'),
                },
                icon: const Icon(
                  Icons.remove,
                  color: buttonPlusMinus,
                ),
                style: IconButton.styleFrom(
                  backgroundColor: buttonPlusMinusBackGround,
                  minimumSize: const Size(40, 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(cornerRadius),
                  ),
                ),
              ),
              const Spacer(),
              const Text(
                '1',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: menuTextColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: () => {
                  log('Plus 1'),
                },
                icon: const Icon(
                  Icons.add,
                  color: buttonPlusMinus,
                ),
                style: IconButton.styleFrom(
                  minimumSize: const Size(40, 40),
                  backgroundColor: buttonPlusMinusBackGround,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(cornerRadius),
                  ),
                ),
              ),
              const SizedBox(
                width: 7,
              ),
            ],
          ),
        ),
      ]
    );
  }
}
