import 'package:flutter/material.dart';

enum PaymentType { member, qris, edc, cash, voucher }

class PaymentOption {
  final IconData icon;
  final String name;
  final PaymentType type;

  PaymentOption(this.icon, this.name, this.type);

  static List<PaymentOption> paymentOptions = [
    PaymentOption(Icons.card_membership, 'Membership', PaymentType.member),
    PaymentOption(Icons.qr_code, 'QRIS', PaymentType.qris),
    PaymentOption(Icons.local_atm, 'EDC', PaymentType.edc),
    PaymentOption(Icons.money, 'Cash', PaymentType.cash),
    PaymentOption(Icons.loyalty, 'Voucher', PaymentType.voucher),
  ];
}
