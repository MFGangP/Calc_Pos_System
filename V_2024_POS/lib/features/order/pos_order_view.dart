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

  // 주문 상태 업데이트가 일어났을 때 부모 뷰에서 호출할 콜백 함수
  void _updateOrderState(int ordIdx) {
    // 상태를 업데이트하는 로직을 추가
    // 예를 들어, 주문 리스트를 다시 가져오는 작업
    setState(() {
      _orderStateManager.updateOrderState(0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: mainBackGroundColor,
        child: Column(
          children: [
            const SizedBox(height: 28),
            // 헤더
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
            // 버튼
            Row(
              children: [
                const SizedBox(width: 42),
                OrderStateButton(
                  buttonText: '결제 대기 중',
                  width: 127,
                  selectedButton: _orderStateManager.orderCompleteExistence[0],
                  onPressed: () async {
                    setState(() {
                      _orderStateManager.updateOrderState(0);
                    });
                  },
                ),
                const SizedBox(width: 19),
                OrderStateButton(
                  buttonText: '결제 완료',
                  width: 114,
                  selectedButton: _orderStateManager.orderCompleteExistence[1],
                  onPressed: () async {
                    setState(() {
                      _orderStateManager.updateOrderState(1);
                    });
                  },
                ),
                const SizedBox(width: 19),
                OrderStateButton(
                  buttonText: '전체',
                  width: 88,
                  selectedButton: _orderStateManager.orderCompleteExistence[2],
                  onPressed: () async {
                    setState(() {
                      _orderStateManager.updateOrderState(2);
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 25),
            // 리스트
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 42),
                child: FutureBuilder<List<OrderItemList>>(
                  future: _orderStateManager.orderDatas,
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
                        child: Text('주문 기록이 없습니다.',
                            style: TextStyle(
                              color: menuTextColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 32,
                            )),
                      );
                    }

                    // 데이터를 가져오면 GridView를 표시
                    List<OrderItemList> orderList = snapshot.data!; // 데이터를 List로 변환
                    return GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3, // 가로에 표시할 아이템 수
                          crossAxisSpacing: 34.0, // 가로 간격
                          mainAxisSpacing: 33.0, // 세로 간격
                        ),
                        itemCount: orderList.length, // 데이터의 길이만큼 반복
                        itemBuilder: (context, index) {
                          return OrderList(
                            orderItemCollection: orderList[index],
                            onStateUpdated: (int ordIdx) {
                              _updateOrderState(ordIdx);
                            },
                          );
                        });
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
