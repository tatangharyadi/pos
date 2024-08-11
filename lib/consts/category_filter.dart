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
    CategoryFilter('Drinks', Icons.coffee, 125, 'beverage'),
    CategoryFilter('Meals', Icons.flatware, 125, 'food'),
  ];
}
