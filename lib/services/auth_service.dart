import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'auth_service.g.dart';

@Riverpod(keepAlive: true)
class AuthService extends _$AuthService{

  @override
  User? build() {
    return FirebaseAuth.instance.currentUser;
  }

  Future<void> signin({
    required String email,
    required String password,
  }) async {

      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password
      );
      await Future.delayed(const Duration(seconds: 1));
      state = FirebaseAuth.instance.currentUser;
  }

  Future<void> signout() async {
    await FirebaseAuth.instance.signOut();
    await Future.delayed(const Duration(seconds: 1));
    state = FirebaseAuth.instance.currentUser;
  }

}