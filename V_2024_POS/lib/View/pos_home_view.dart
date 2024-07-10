import 'package:flutter/material.dart';
import 'package:possystem/Model/db_connector.dart';

import 'package:flutter/material.dart';

class PosHomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          width: 134.87,
          height: 134.88,
          decoration: ShapeDecoration(
            color: Color(0xFFFBFBFB),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(13),
            ),
          ),
        ),
      ]
    );
  }
}