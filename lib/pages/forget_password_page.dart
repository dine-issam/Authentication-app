import 'package:auth_app/pages/reset_password_page.dart';
import 'package:auth_app/services/auth/auth_gate.dart';
import 'package:auth_app/services/auth/auth_service.dart';
import 'package:auth_app/utils/my_button.dart';
import 'package:auth_app/utils/my_loading_circle.dart';
import 'package:auth_app/utils/my_text_field.dart';
import 'package:flutter/material.dart';
// ignore: unnecessary_import
import 'package:flutter/widgets.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({super.key});

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  final TextEditingController _emailController = TextEditingController();

  final _auth = AuthService();
  final loadingCircle = MyLoadingCircle();

  void _resetPassword(String email) async {
    try {
      loadingCircle.showLoadingCircle(context);
      await _auth.sendEmailResetPasswordLink(email);
      if (mounted) loadingCircle.hideLoadingCircle(context);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ResetPasswordPage(
                    email: _emailController.text,
                  )));
    } catch (e) {
      rethrow;
    }
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AuthGate()));
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Text(
              "Forget password",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            const Text(
                "Don't worry sometimes people can forger too, enter your email and we will send you a password reset email link."),
            const SizedBox(height: 50),
            MyTextField(
              controller: _emailController,
              hintText: "E-Mail",
              icon: Icons.email_outlined,
              icon1: null,
            ),
            const SizedBox(height: 40),
            GestureDetector(
                onTap: () {
                  _resetPassword(_emailController.text);
                },
                child: const MyButton(title: "Submit"))
          ],
        ),
      ),
    );
  }
}
