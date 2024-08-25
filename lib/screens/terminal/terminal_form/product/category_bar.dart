import 'package:flutter/material.dart';
import 'package:pos/components/barcode_dialog/barcode_dialog.dart';
import 'package:pos/consts/category_filter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos/models/product/product_query_repository.dart';

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
              final queryRepository = ref.read(productQueryRepositoryProvider.notifier);
              switch (categoryFilter.filter) {
                case 'PIN1':
                  queryRepository.filterByPin1();
                  break;
                case 'PIN2':
                  queryRepository.filterByPin2();
                  break;
                case 'BARCODE':
                  showGeneralDialog(
                    context: context,
                    pageBuilder: (context, animation, secondaryAnimation) {
                          return const BarcodeDialog();
                    },
                  );
                  break;
                default:
                  queryRepository.filterByBase('*');
              }
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
