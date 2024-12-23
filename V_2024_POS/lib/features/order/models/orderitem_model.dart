class OrderItem {
  final int ordIdx;
  final int orderNum;
  final String prdName;
  final int prdPrice;
  final int quantity;
  final int totalPrice;
  final int orderPrice;
  final DateTime orderDt;
  final int orderState;

  OrderItem({
    required this.ordIdx,
    required this.orderNum,
    required this.prdName,
    required this.prdPrice,
    required this.quantity,
    required this.totalPrice,
    required this.orderPrice,
    required this.orderDt,
    required this.orderState,
  });
}

class Orders {
  final int ordIdx;
  final DateTime orderDt;
  final int orderPrice;
  final int orderNum;
  final int orderState;

  Orders({
    required this.ordIdx,
    required this.orderDt,
    required this.orderPrice,
    required this.orderNum,
    required this.orderState,
  });
}

class OrderItemCollection {
  final Orders orders;
  final List<OrderItem> orderItem;

  OrderItemCollection({
    required this.orders,
    required this.orderItem,
  });
}
