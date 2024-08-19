enum ShiftAuthOption  {
  none,
  shift,
}
class ShiftAuthState {
  late ShiftAuthOption state = ShiftAuthOption.none;
  late String id = 'no shift';
  late String name = "no shift";

  ShiftAuthState({
    required this.state,
    this.id = 'no shift',
    this.name = "no shift",
  });
}