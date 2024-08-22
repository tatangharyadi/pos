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
    CategoryFilter('RTE', Icons.fastfood, 125, 'rte'),
    CategoryFilter('Pin1', Icons.bookmark, 125, 'PIN1'),
    CategoryFilter('Pin2', Icons.bookmark, 125, 'PIN2'),
  ];
}
