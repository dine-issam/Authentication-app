import 'dart:async';

import 'package:auth_app/models/user.dart';
import 'package:auth_app/pages/home_page.dart'; // Import the HomePage
import 'package:auth_app/pages/login_page.dart';
import 'package:auth_app/pages/successfully_page.dart';
import 'package:auth_app/services/auth/auth_service.dart';
import 'package:auth_app/services/auth/login_or_register.dart';
import 'package:auth_app/services/database/database_provider.dart';
import 'package:auth_app/utils/my_button.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

class VerifyEmailPage extends StatefulWidget {
  const VerifyEmailPage({super.key, required this.uid});
  final String uid;

  @override
  State<VerifyEmailPage> createState() => _VerifyEmailPageState();
}

class _VerifyEmailPageState extends State<VerifyEmailPage> {
  final _auth = AuthService();
  late final DatabaseProvider databaseProvider =
      Provider.of<DatabaseProvider>(context, listen: false);

  // User info
  UserProfile? user;
  bool _isLoading = true;
  bool _isCheckingVerification = false;

  @override
  void initState() {
    super.initState();
    _auth.sendEmailVerificationLink(); // Send verification email
    LoadUser(); // Load user data from database
    _checkEmailVerificationPeriodically(); // Periodically check if the email is verified
  }

  // Load user data from the database
  Future<void> LoadUser() async {
    user = await databaseProvider.userProfile(widget.uid);
    setState(() {
      _isLoading = false;
    });
  }

  // Reload Firebase user and check if email is verified
  Future<bool> isEmailVerified() async {
    User? currentUser = FirebaseAuth.instance.currentUser;
    await currentUser
        ?.reload(); // Reload user to get updated verification status
    return currentUser?.emailVerified ?? false;
  }

  // Periodically check if the email is verified
  void _checkEmailVerificationPeriodically() {
    Timer.periodic(const Duration(seconds: 5), (timer) async {
      bool isVerified = await isEmailVerified();
      if (isVerified) {
        timer.cancel(); // Stop checking when email is verified
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const SuccessfullyPage()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 25.0),
            child: GestureDetector(
              onTap: () {
                _auth.logout(); // Log the user out
              },
              child: Icon(
                Icons.cancel_outlined,
                color: Theme.of(context).colorScheme.primary,
                size: 30,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            Image.asset(
              "assets/images/receive_email.png",
              scale: 1.5,
            ),
            const SizedBox(height: 20),
            const Text(
              "Verify your email address!",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            const SizedBox(height: 10),
            Text(
              _isLoading ? 'Loading...' : user?.email ?? 'No email available',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            const Text(
              "Congratulations! Your account awaits. Verify your email to start shopping and experience a world of unrivaled opportunities!",
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () async {
                setState(() {
                  _isCheckingVerification = true;
                });
                bool isVerified = await isEmailVerified();
                setState(() {
                  _isCheckingVerification = false;
                });
                if (isVerified) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SuccessfullyPage()),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text("Please verify your email first.")),
                  );
                }
              },
              child: _isCheckingVerification
                  ? const CircularProgressIndicator()
                  : const MyButton(
                      title: "Continue",
                    ),
            ),
            const SizedBox(height: 30),
            GestureDetector(
              onTap: () async {
                await _auth
                    .sendEmailVerificationLink(); // Resend verification email
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text("Verification email sent again.")),
                );
              },
              child: const Text(
                "Resend Email",
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
