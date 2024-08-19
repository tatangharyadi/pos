import 'package:pos/models/shift/shift_repository.dart';
import 'package:realm/realm.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:pos/states/shift/shift_auth_model.dart';

part 'shift_auth_provider.g.dart';

@riverpod
class ShiftAuth extends _$ShiftAuth {
  @override
  ShiftAuthState build() {
    final shiftAuthState = ShiftAuthState(
      state: ShiftAuthOption.none,
    );
    return shiftAuthState;
  }

  bool login(String pin) {
    final shiftRepository = ref.read(shiftRepositoryProvider.notifier);
    final result = shiftRepository.login(pin);

    late ShiftAuthState authState;
    if (result == null) {
      authState = ShiftAuthState(
        state: ShiftAuthOption.none,
      );
      state = authState;
      return false;
    }

    authState = ShiftAuthState(
      state: ShiftAuthOption.shift,
      id: result.id.toString(),
      name: result.name,
    );
    state = authState;
    return true;
  }

  bool logout() {
    ObjectId id = ObjectId.fromHexString(state.id);
    final shiftRepository = ref.read(shiftRepositoryProvider.notifier);
    shiftRepository.logout(id);

    final shiftAuthState = ShiftAuthState(
      state: ShiftAuthOption.none,
    );
    state = shiftAuthState;
    return true;
  }
}