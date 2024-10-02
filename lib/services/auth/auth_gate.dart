import 'package:auth_app/pages/home_page.dart';
import 'package:auth_app/pages/verify_email_page.dart';
import 'package:auth_app/services/auth/auth_service.dart';
import 'package:auth_app/services/auth/login_or_register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthGate extends StatelessWidget {
  AuthGate({super.key});
  final _auth = AuthService();

  Future<void> _reloadUser(User? user) async {
    if (user != null) {
      await user.reload(); // Reload the user's data
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // If there is no data, the user is not logged in, so show login or register page
          if (!snapshot.hasData) {
            return const LoginOrRegister();
          } else {
            User? user = snapshot.data;

            // Ensure that the user's data is reloaded to get the latest email verification status
            return FutureBuilder(
              future: _reloadUser(user),
              builder: (context, reloadSnapshot) {
                // Show a loading indicator while reloading the user's data
                if (reloadSnapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                // Check if the user's email is verified
                if (!user!.emailVerified) {
                  return VerifyEmailPage(
                      uid: _auth
                          .getCurrentUid()); // Redirect to verification page
                } else {
                  return HomePage(
                    uid: _auth.getCurrentUid(),
                  );
                }
              },
            );
          }
        },
      ),
    );
  }
}
