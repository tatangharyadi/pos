import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'total_due_provider.g.dart';

@riverpod
class TotalDue extends _$TotalDue {
  @override
  double build() {
    return 0.0;
  }

  void increment(double amount) {
    state += amount;
  }

  void decrement(double amount) {
    state -= amount;
  }
}