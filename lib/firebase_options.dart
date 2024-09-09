// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBcuZ4kTJJFrrTlvTFOwII7ujYpMnn1HJE',
    appId: '1:239104774500:android:53b4dfc3f188101e8f2a71',
    messagingSenderId: '239104774500',
    projectId: 'pos-prod-6461a',
    storageBucket: 'pos-prod-6461a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBwZLF0qvWd-DuApgx4hTxqKi924VosHvM',
    appId: '1:239104774500:ios:14b58bbf15b874dc8f2a71',
    messagingSenderId: '239104774500',
    projectId: 'pos-prod-6461a',
    storageBucket: 'pos-prod-6461a.appspot.com',
    iosBundleId: 'com.example.pos',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBwZLF0qvWd-DuApgx4hTxqKi924VosHvM',
    appId: '1:239104774500:ios:14b58bbf15b874dc8f2a71',
    messagingSenderId: '239104774500',
    projectId: 'pos-prod-6461a',
    storageBucket: 'pos-prod-6461a.appspot.com',
    iosBundleId: 'com.example.pos',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDjHwcLZu2S__LTwX9XAXebyljb3dsh1FY',
    appId: '1:239104774500:web:30ccc996a9cac3888f2a71',
    messagingSenderId: '239104774500',
    projectId: 'pos-prod-6461a',
    authDomain: 'pos-prod-6461a.firebaseapp.com',
    storageBucket: 'pos-prod-6461a.appspot.com',
  );

}