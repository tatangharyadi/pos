import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:pos/components/query_form/query_form.dart';
import 'package:pos/screens/product/product_list/product_grid.dart';

class ProductPanel extends ConsumerStatefulWidget {
  const ProductPanel({super.key});

  @override
  ConsumerState<ProductPanel> createState() => _ProductPanelState();
}

class _ProductPanelState extends ConsumerState<ProductPanel> {
  final _formKey = GlobalKey<FormBuilderState>();

  void _onQueryPressed(String value) {
      print(value);
  }
  
  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 18.0, right: 18.0),
            child: queryForm(context, _formKey, _onQueryPressed),
          ),
          const Expanded(
            child: ProductGrid()
          )
        ],
    );
  }
}