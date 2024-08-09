import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos/screens/product/product_detail/product_info.dart';
import 'package:pos/screens/product/product_detail/product_modifier.dart';
import 'package:pos/screens/product/product_detail/product_price.dart';

class ProductDetail extends ConsumerStatefulWidget {
  final String id;

  const ProductDetail({super.key, required this.id});

  @override
  ConsumerState<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends ConsumerState<ProductDetail>
  with SingleTickerProviderStateMixin {
  late final tabController = TabController(length: 3, vsync: this);

  @override
  Widget build(BuildContext context) {
    return Scaffold(    
      appBar: AppBar(
        title: Text('Product: ${widget.id}'),
      ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Product Name'),
                TabBar(
                controller: tabController,
                  tabs: const [
                    Tab(icon: Icon(Icons.info)),
                    Tab(icon: Icon(Icons.format_list_bulleted_add)),
                    Tab(icon: Icon(Icons.paid)),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    controller: tabController,
                    children: [
                      productInfoView(),
                      productModifierView(),
                      productPriceView(),
                    ],
                  ),
                ),
              ],
                  ),
          ),
    );
  }
}