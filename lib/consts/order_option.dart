import 'package:flutter/material.dart';

class OrderOption {
  final IconData icon;
  final String type;

  OrderOption(this.icon, this.type);

  static List<OrderOption> orderOptions = [
    OrderOption(Icons.shopping_bag_outlined, 'TAKEAWAY'),
    OrderOption(Icons.dining_outlined, 'DINING'),
    OrderOption(Icons.shopping_basket_outlined, 'COUNTER'),
  ];
}