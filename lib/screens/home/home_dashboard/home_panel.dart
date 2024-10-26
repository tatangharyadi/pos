import 'package:flutter/material.dart';
import 'package:pos/screens/home/home_dashboard/sales/sales_chart.dart';

class HomePanel extends StatefulWidget {
  const HomePanel({super.key});

  @override
  State<HomePanel> createState() => _HomePanelState();
}

class _HomePanelState extends State<HomePanel> {
  List<double> weeklySummary = [
    4.40,
    2.50,
    42.42,
    10.50,
    100.20,
    88.99,
    90.19,
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
      height: 400,
      child: SalesChart(
        weeklySummary: weeklySummary,
      ),
    ));
  }
}
