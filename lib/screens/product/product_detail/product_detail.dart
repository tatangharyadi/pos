import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos/models/product/product_repository.dart';
import 'package:realm/realm.dart';
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
  late ObjectId _objectId;

  @override
  void initState() {
    super.initState();
    _objectId = ObjectId.fromHexString(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    final productRepository = ref.watch(productRepositoryProvider.notifier);
    final product = productRepository.findById(_objectId);

    return Scaffold(    
      appBar: AppBar(
        title: Text(product!.name),
      ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                      productInfoView(product),
                      productModifierView(product),
                      productPriceView(product),
                    ],
                  ),
                ),
              ],
                  ),
          ),
    );
  }
}