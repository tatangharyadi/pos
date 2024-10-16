import 'package:flutter/foundation.dart' as foundation;
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pos/components/dialog/dialog_header.dart';
import 'package:pos/components/dialog/dialog_buttons.dart';
import 'package:pos/components/dialog/dialog_footer.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:pos/models/payment/payment_model.dart';
import 'package:pos/models/payment/payment_repository.dart';
import 'package:pos/models/qris_payment/qris_payment_model.dart';
import 'package:pos/models/qris_payment/qris_payment_repository.dart';
import 'package:pos/states/total_due/total_due_provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:realm/realm.dart';

class PaymentQrisDialog extends ConsumerStatefulWidget {
  final String paymentName;
  final IconData icon;
  final String orderId;
  final String parentId;

  const PaymentQrisDialog({super.key, required this.paymentName, required this.icon,
    required this.orderId, required this.parentId});

  @override
  ConsumerState<PaymentQrisDialog> createState() => _PaymentQrisDialogState();
}

class _PaymentQrisDialogState extends ConsumerState<PaymentQrisDialog> {
  late double _amount;
  late Future<QrisPayment> _qrString;
  String _orderId = 'none';
  String _message = 'Waiting...';

  @override
  void initState() {
    super.initState();
    _amount = ref.read(totalDueProvider) >= 0 ? ref.read(totalDueProvider) : 0;
    final qrisPaymentRepository = ref.read(qrisPaymentRepositoryProvider.notifier);
    _qrString = qrisPaymentRepository.createQrPayment(_amount);

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {

      if(foundation.kDebugMode) {
        print('DEBUG: QR Payment Title ${message.notification?.title}');
        print('DEBUG: QR Payment Body ${message.notification?.body}');
        print('DEBUG: QR Payment Data ${message.data}');
      }

      setState(() {
        _orderId = message.data['orderId'].toString();
        _message = message.data['status'].toString();
      });
    });
  }

  void onClickCancel() {
    context.pop();
  }

  void onClickOk() {
    if(_message != 'SUCCEEDED') {
       context.pop();
       return;
    }

    final payment = Payment(
      ObjectId(),
      ObjectId.fromHexString(widget.parentId),
      ObjectId.fromHexString(widget.orderId),
      'QRIS',
      DateTime.now().toUtc(),
      _orderId,
      amount: _amount,
    );

    final paymentRepository = ref.read(paymentRepositoryProvider.notifier);
    paymentRepository.create(payment);
    ref.read(totalDueProvider.notifier).decrement(_amount);

    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    return 
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DialogHeader(
                icon: widget.icon,
                title: widget.paymentName,
              ),

              Container(
                height: 300,
                width: MediaQuery.of(context).size.width * 0.5,
                child: Material(
                  child: 

                      FutureBuilder(
                        future: _qrString,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return const Center(child: CircularProgressIndicator());
                          } else if (snapshot.hasError) {
                            return Center(child: Text('Error: ${snapshot.error}'));
                          }

                          return Column(
                            children: [
                              Text('Scan QR Code to pay: ${snapshot.data?.amount}'),
                              const Gap(10),
                              QrImageView(
                              data: snapshot.data!.qrString,
                              version: QrVersions.auto,
                              size: 200),
                              const Gap(10),
                              Text("Status: $_message")
                            ]
                          );
                        }
                      ),
                    )
                  ),
              DialogButtons(onClickOk: onClickOk, onClickCancel: onClickCancel),
              const DialogFooter(),
            ],
          )
        );
      }
  }

