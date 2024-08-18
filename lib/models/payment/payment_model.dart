import 'package:realm/realm.dart';

part 'payment_model.realm.dart';

@RealmModel()
@MapTo("payments")
class _Payment {
  @PrimaryKey()
  @MapTo("_id")
  late ObjectId id;

  @Indexed()
  late String type;
  late DateTime paymentDate;
  late String reference;
  late double amount = 0.0;
  @Indexed()
  late ObjectId orderId;

  late bool selected = false;
}