import 'package:flutter/foundation.dart' as foundation;
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'firebase_options.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseMessaging.instance.subscribeToTopic('pos');
  final fcmToken = await FirebaseMessaging.instance.getToken();
  if(foundation.kDebugMode) {
    print('FCM Token: $fcmToken');
  }

  runApp(const ProviderScope(child: MyApp()),);
}
