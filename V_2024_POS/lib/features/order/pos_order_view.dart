import 'package:flutter/material.dart';
import 'package:possystem/features/order/presentation/order_list.dart';
import 'package:possystem/shared/orderstate_manager.dart';
import 'package:possystem/shared/utils/color_constants.dart';
import 'package:possystem/features/order/presentation/order_state_button.dart';

class PosOrderView extends StatefulWidget {
  const PosOrderView({super.key});

  @override
  _PosOrderViewState createState() => _PosOrderViewState();
}

class _PosOrderViewState extends State<PosOrderView> {
  final OrderStateManager _orderStateManager = OrderStateManager();

  // 상태를 업데이트하고 UI를 갱신하는 함수
  Future<void> _updateOrderState(int index) async {
    _orderStateManager.updateOrderState(index);
    setState(() {}); // 상태 변경 후 UI 갱신
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: mainBackGroundColor,
        child: Column(
          children: [
            const SizedBox(height: 28),
            const Row(
              children: [
                SizedBox(width: 42),
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
            const SizedBox(height: 25),
            Row(
              children: [
                const SizedBox(width: 42),
                OrderStateButton(
                    buttonText: '전체',
                    width: 88,
                    selectedButton:
                        _orderStateManager.orderCompleteExistence[0],
                    onPressed: () => {
                          _orderStateManager.updateOrderState(0),
                          setState(() {}) // 상태 변경 후 UI 갱신
                        }),
                const SizedBox(width: 19),
                OrderStateButton(
                  buttonText: '결제 대기 중',
                  width: 127,
                  selectedButton: _orderStateManager.orderCompleteExistence[1],
                  onPressed: () => _updateOrderState(1),
                ),
                const SizedBox(width: 19),
                OrderStateButton(
                  buttonText: '결제 완료',
                  width: 114,
                  selectedButton: _orderStateManager.orderCompleteExistence[2],
                  onPressed: () => _updateOrderState(2),
                ),
              ],
            ),
            const SizedBox(height: 25),
            // for (int item = 0; item < _orderStateManager.orders.length; item++){
            //   if(_orderStateManager.orders[item] > 0)
            //   OrderDetail(
            //     orderNumber: orderNumber,
            //     orderDate: orderDate,
            //     orderItems: orderItems,
            //     totalPrice: totalPrice,
            //     onDetailPressed: onDetailPressed,
            //     onCompletePressed: onCompletePressed
            //   )
            // },
          ],
        ),
      ),
    );
  }
}
