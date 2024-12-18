import 'package:flutter/material.dart';
import 'package:possystem/shared/utils/color_constants.dart';
import 'package:possystem/features/pos/data/db_manager.dart';
import 'package:possystem/features/pos/presentation/pos_order_view/components/order_state_button.dart';

class PosOrderView extends StatefulWidget {
  const PosOrderView({super.key});

  @override
  _PosOrderViewState createState() => _PosOrderViewState();
}

class _PosOrderViewState extends State<PosOrderView> {
  final MySqlConnector _mySqlConnector = MySqlConnector();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: mainBackGroundColor,
      child: Column(
        children: [
          const SizedBox(
            height: 28,
          ),
          const Row(
            children: [
              SizedBox(
                width: 42,
              ),
              Text(
                '주문 기록',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: menuTextColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          Row(
            children: [
              const SizedBox(
                width: 42,
              ),
              // '전체' 버튼
              OrderStateButton(
                  buttonText: '전체',
                  width: 88,
                  selectedButton: _mySqlConnector.orderCompleteExistence[0],
                  onPressed: () => setState(() {
                        _mySqlConnector.updateOrderState(0);
                      })),
              const SizedBox(
                width: 19,
              ),
              // '결제 대기 중' 버튼
              OrderStateButton(
                  buttonText: '결제 대기 중',
                  width: 127,
                  selectedButton: _mySqlConnector.orderCompleteExistence[1],
                  onPressed: () => setState(() {
                        _mySqlConnector.updateOrderState(1);
                      })),
              const SizedBox(
                width: 19,
              ),
              // '결제 완료' 버튼
              OrderStateButton(
                  buttonText: '결제 완료',
                  width: 114,
                  selectedButton: _mySqlConnector.orderCompleteExistence[2],
                  onPressed: () => setState(() {
                        _mySqlConnector.updateOrderState(2);
                      })),
            ],
          ),
        ],
      ),
    );
  }
}
