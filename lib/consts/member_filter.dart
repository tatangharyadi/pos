import 'package:flutter/material.dart';

class MemberFilter {
  final String name;
  final IconData icon;
  final double width;
  final String filter;

  MemberFilter(this.name, this.icon, this.width, this.filter);

  static List<MemberFilter> categoryFilters = [
    MemberFilter('', Icons.home, 75, 'all'),
    MemberFilter('', Icons.search, 75, 'all'),
    MemberFilter('Barcode', Icons.barcode_reader, 150, 'BARCODE'),
  ];
}
