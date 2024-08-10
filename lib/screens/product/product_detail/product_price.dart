import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pos/models/product/product_model.dart';

DataTable _buildTable(Product product) {
  final List<Map<String, dynamic>> header = [
    {"title": "Effective Time", "numeric": false},
    {"title": "Expiry Time", "numeric": false},
    {"title": "Price", "numeric": true},
  ];

  return DataTable(
    headingTextStyle: const TextStyle(
      fontWeight: FontWeight.bold,
    ),
    columns: header.map((item) {
        return DataColumn(
          label: Text(item['title']),
          numeric: item['numeric'],
        );
      }).toList(),

    rows: List<DataRow>.generate(
      product.prices.length, (index) {
        Price price = product.prices[index];

        return DataRow(
          key: ValueKey(price.id),
          cells: [
            DataCell(
              Text(
                price.priceEffectiveTime == null ? '' :
                DateFormat("yyyy-MM-dd kk:mm").format(price.priceEffectiveTime!.toLocal()),
              ),
            ),
            DataCell(
              Text(
                price.priceExpireTime == null ?'' :
                DateFormat("yyyy-MM-dd kk:mm").format(price.priceExpireTime!.toLocal()),
              ),
            ),
            DataCell(
              Text(price.price.toString()),
            )
          ],
        );
      },
    ),
  );  // Build the table
}

Padding productPriceView(Product product) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: 
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child:
          _buildTable(product),
      ),
  );
}