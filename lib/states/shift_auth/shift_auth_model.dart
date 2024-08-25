enum ShiftAuthOption  {
  none,
  shift,
}
class ShiftAuthState {
  late ShiftAuthOption state = ShiftAuthOption.none;
  late String id = 'NONE';
  late String name = "no shift";
  DateTime? startTime;

  ShiftAuthState({
    required this.state,
    this.id = 'NONE',
    this.name = "no shift",
  });
}