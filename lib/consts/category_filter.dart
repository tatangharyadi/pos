import 'package:flutter/material.dart';

class CategoryFilter {
  final String name;
  final IconData icon;
  final double width;
  final String filter;

  CategoryFilter(this.name, this.icon, this.width, this.filter);

  static List<CategoryFilter> categoryFilters = [
    CategoryFilter('', Icons.home, 75, 'all'),
    CategoryFilter('', Icons.search, 75, 'all'),
    CategoryFilter('Pin1', Icons.bookmark, 125, 'PIN1'),
    CategoryFilter('Pin2', Icons.bookmark, 125, 'PIN2'),
    CategoryFilter('Barcode', Icons.barcode_reader, 150, 'BARCODE'),
  ];
}
