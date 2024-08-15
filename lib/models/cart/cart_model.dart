class CartItemModifier {
  String modifierId;
  String collectionId;
  String? sku;
  String name;
  double unitPrice = 0.0;

  CartItemModifier({
    required this.modifierId,
    required this.collectionId,
    this.sku,
    required this.name,
    required this.unitPrice,
  });
}

class CartItem {
    String orderLineId;
    String productId;
    String? sku;
    String name;
    double unitPrice = 0.0;
    int qty;
    List<CartItemModifier> modifiers = [];

  CartItem({
    required this.orderLineId,
    required this.productId,
    this.sku,
    required this.name,
    required this.unitPrice,
    required this.qty,
    this.modifiers = const [],
  });
}

class Cart {
  String orderId;
  List<CartItem> items = [];

  Cart({
    required this.orderId,
    this.items = const [],
  });
}
