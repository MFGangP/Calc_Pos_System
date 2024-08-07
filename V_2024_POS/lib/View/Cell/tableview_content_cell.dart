import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:possystem/View/Color/colors.dart';

class HomeViewTableContent{

  static const double cornerRadius = 13;

  static DataRow createDataRow() {
    return DataRow(
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
        DataCell(
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
              Text(
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
            ],
          ),
        ),
      ]
    );
  }
}
