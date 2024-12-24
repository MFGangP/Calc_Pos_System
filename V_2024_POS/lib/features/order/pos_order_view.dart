import 'package:flutter/material.dart';
import 'package:possystem/features/order/data/orderstate_manager.dart';
import 'package:possystem/features/order/models/orderitem_model.dart';
import 'package:possystem/features/order/presentation/order_list.dart';
import 'package:possystem/shared/utils/color_constants.dart';
import 'package:possystem/features/order/presentation/order_state_button.dart';

class PosOrderView extends StatefulWidget {
  const PosOrderView({super.key});

  @override
  _PosOrderViewState createState() => _PosOrderViewState();
}

class _PosOrderViewState extends State<PosOrderView> {
  final OrderStateManager _orderStateManager = OrderStateManager();
  late Future<List<OrderItemList>> _orderItemsFuture; // 데이터를 담을 Future

  @override
  void initState() {
    super.initState();
    _orderItemsFuture = _loadOrderData(); // 데이터를 미리 로드
  }

  Future<List<OrderItemList>> _loadOrderData() async {
    await _orderStateManager.updateOrderState(0); // DB에서 데이터를 업데이트
    return _orderStateManager.orderDatas; // 데이터를 반환
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<OrderItemList>>(
        future: _orderItemsFuture, // 미리 로드된 데이터를 사용
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error.toString()}'),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text('No orders available'),
            );
          }

          final orderList = snapshot.data!;

          return Container(
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
                      onPressed: () async {
                        setState(() {
                          _orderItemsFuture = _orderStateManager.updateOrderState(0).then(
                                (_) => _orderStateManager.orderDatas,
                              );
                        });
                      },
                    ),
                    const SizedBox(width: 19),
                    OrderStateButton(
                      buttonText: '결제 대기 중',
                      width: 127,
                      selectedButton: _orderStateManager.orderCompleteExistence[1],
                      onPressed: () async {
                        setState(() {
                          _orderItemsFuture = _orderStateManager.updateOrderState(1).then(
                                (_) => _orderStateManager.orderDatas,
                              );
                        });
                      },
                    ),
                    const SizedBox(width: 19),
                    OrderStateButton(
                      buttonText: '결제 완료',
                      width: 114,
                      selectedButton: _orderStateManager.orderCompleteExistence[2],
                      onPressed: () async {
                        setState(() {
                          _orderItemsFuture = _orderStateManager.updateOrderState(2).then(
                                (_) => _orderStateManager.orderDatas,
                              );
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                const Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 42), // 좌우 여백
                    child: OrderList(),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
