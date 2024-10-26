import 'package:pos/screens/home/home_dashboard/sales/chart_bar.dart';

class SalesData {
  final double sunAmount;
  final double monAmount;
  final double tueAmount;
  final double wedAmount;
  final double thuAmount;
  final double friAmount;
  final double satAmount;

  SalesData({
    required this.sunAmount,
    required this.monAmount,
    required this.tueAmount,
    required this.wedAmount,
    required this.thuAmount,
    required this.friAmount,
    required this.satAmount,
  });

  List<ChartBar> salesData = [];

  void InitializeSalesData() {
    salesData = [
      ChartBar(x: 0, y: sunAmount),
      ChartBar(x: 1, y: monAmount),
      ChartBar(x: 2, y: tueAmount),
      ChartBar(x: 3, y: wedAmount),
      ChartBar(x: 4, y: thuAmount),
      ChartBar(x: 5, y: friAmount),
      ChartBar(x: 6, y: satAmount),
    ];
  }
}
