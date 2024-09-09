import 'package:flutter/foundation.dart' as foundation;
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pos/navbar.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});
  
  Future<void> _requestPermission() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );
    if(foundation.kDebugMode) {
      print('User granted permission: ${settings.authorizationStatus}');
    }
  }

  Future<String?> _getToken() async {
    final fcmToken = await FirebaseMessaging.instance.getToken();
    if(foundation.kDebugMode) {
      print('FCM Token: $fcmToken');
    }
    return fcmToken;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavBar(),
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
        
            Expanded(
              child: FutureBuilder<String?>(
                future: _getToken(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (snapshot.hasData) {
                    return TextField(
                      readOnly: true,
                      style: Theme.of(context).textTheme.bodySmall,
                      decoration: const InputDecoration(
                        labelText: 'FCM Token',
                        border: OutlineInputBorder(),
                      ),
                      controller: TextEditingController(
                        text: snapshot.data,
                      ),
                    );
                  } else {
                    return const Text('No token available');
                  }
                },
              ),
            ),
            const Gap(5),
            ElevatedButton(
              onPressed: _requestPermission,
              child: const Text('Notification Permission'),
            ),
          ]
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        height: 30,
        child: Container(height: 5),
      ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        onPressed: () {
            context.go(context.namedLocation(
                'home',
            )
          );
        },
        child: const Icon(Icons.check),
      ), 
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,          
    );
  }
}