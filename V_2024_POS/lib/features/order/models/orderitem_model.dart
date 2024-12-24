class OrderItem {
  final String ordIdx;
  final String orderNum;
  final String prdName;
  final String prdPrice;
  final String quantity;
  final String totalPrice;
  final String orderPrice;
  final DateTime orderDt;
  final String orderState;

  OrderItem({
    required this.prdName,
    required this.ordIdx,
    required this.orderNum,
    required this.prdPrice,
    required this.quantity,
    required this.totalPrice,
    required this.orderPrice,
    required this.orderDt,
    required this.orderState,
  });
}

class Orders {
  final String? ordIdx;
  final String? orderDt;
  final String? orderPrice;
  final String? orderNum;
  final String? orderState;

  Orders({
    required this.ordIdx,
    required this.orderDt,
    required this.orderPrice,
    required this.orderNum,
    required this.orderState,
  });
}

class OrderItemList {
  late final Orders orders;
  final List<Map<String, dynamic>> orderItem;

  OrderItemList({
    required this.orders,
    required this.orderItem,
  });
}
