import 'package:auth_app/pages/home_page.dart';
import 'package:auth_app/services/auth/auth_service.dart';
import 'package:auth_app/services/auth/login_or_register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthGate extends StatelessWidget {
  AuthGate({super.key});
  final _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // user is logged in
          if (snapshot.hasData) {
            return HomePage(
              uid: _auth.getCurrentUid(),
            );
          } else {
            return const LoginOrRegister();
          }
        },
      ),
    );
  }
}
