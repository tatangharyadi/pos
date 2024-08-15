import 'package:realm/realm.dart';

part 'payment_model.realm.dart';

@RealmModel()
@MapTo("payments")
class _Payment {
  @PrimaryKey()
  @MapTo("_id")
  late ObjectId id;

  @Indexed()
  late ObjectId orderId;
  late String paymentType;
  late DateTime paymentDate;
  late double amount = 0.0;

  late bool selected = false;
}