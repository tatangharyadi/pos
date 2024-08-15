import 'package:flutter/material.dart';

class PaymentType {
  final String name;
  final IconData icon;
  final double width;
  final String type;

  PaymentType(this.name, this.icon, this.width, this.type);

  static List<PaymentType> paymentTypes = [
    PaymentType('Membership', Icons.card_membership, 75, 'MEMBERSHIP'),
    PaymentType('QRIS', Icons.qr_code, 75, 'QRIS'),
    PaymentType('EDC', Icons.local_atm, 125, 'EDC'),
    PaymentType('Cash', Icons.money, 125, 'CASH'),
    PaymentType('Voucher', Icons.loyalty, 125, 'VOUCHER'),
  ];
}
