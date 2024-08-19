import 'package:pos/models/shift/shift_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'shift_auth_provider.g.dart';

enum ShiftAuthState {
  none,
  shift,
}

@riverpod
class ShiftAuth extends _$ShiftAuth {
  @override
  ShiftAuthState build() {
    return ShiftAuthState.none;
  }

  bool login(String pin) {
    final shiftRepository = ref.read(shiftRepositoryProvider.notifier);
    final result = shiftRepository.login(pin);
    if (!result) {
      state = ShiftAuthState.none;
      return false;
    }
    state = ShiftAuthState.shift;
    return true;
  }
}