import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos/consts/category_filter.dart';
import 'package:pos/models/category/category_query_repository.dart';

class CategoryBar extends ConsumerWidget {
  const CategoryBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<CategoryFilter> categoryFilters = CategoryFilter.categoryFilters;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoryFilters.length,
        itemBuilder: (context, index) {
          CategoryFilter categoryFilter = categoryFilters[index];
          return GestureDetector(
            onTap: () {
              ref.read(categoryQueryRepositoryProvider.notifier).setQuery(
                categoryFilter.filter
              );
            },
            child: SizedBox(
              width: categoryFilter.width,
              child: ListTile(
                leading: Icon(categoryFilter.icon),
                title: Text(categoryFilter.name),
                dense: true,
              ),
            ),
          );
        },
      ),
    );
  }
}
