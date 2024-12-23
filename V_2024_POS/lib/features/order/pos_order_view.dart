import 'package:flutter/material.dart';
import 'package:possystem/features/order/presentation/order_detail.dart';
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
  bool _isLoading = true; // 로딩 상태

  @override
  void initState() {
    super.initState();
    _loadOrderData();
  }

  Future<void> _loadOrderData() async {
    // DB에서 데이터를 가져오는 메서드 호출
    await _orderStateManager.updateOrderState(0);
    setState(() {
      _isLoading = false; // 로딩 완료
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(), // 로딩 표시
            )
          : Container(
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
                          selectedButton: _orderStateManager.orderCompleteExistence[0],
                          onPressed: () => {
                                _orderStateManager.updateOrderState(0),
                                setState(() {}) // 상태 변경 후 UI 갱신
                              }),
                      const SizedBox(width: 19),
                      OrderStateButton(
                        buttonText: '결제 대기 중',
                        width: 127,
                        selectedButton: _orderStateManager.orderCompleteExistence[1],
                        onPressed: () => _orderStateManager.updateOrderState(1),
                      ),
                      const SizedBox(width: 19),
                      OrderStateButton(
                        buttonText: '결제 완료',
                        width: 114,
                        selectedButton: _orderStateManager.orderCompleteExistence[2],
                        onPressed: () => _orderStateManager.updateOrderState(2),
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),
                  // Expanded(
                  //   child: _orderStateManager.orders.isEmpty
                  //       ? const Center(
                  //           child: Text('주문 기록이 없습니다.',
                  //               style: TextStyle(
                  //                 color: menuTextColor,
                  //                 fontSize: 16,
                  //               )),
                  //         )
                  //       :
                  // )
                ],
              ),
            ),
    );
  }
}
