import 'package:auth_app/pages/login_page.dart';
import 'package:auth_app/utils/my_button.dart';
import 'package:flutter/material.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 25.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const LoginPage()));
              },
              child:  Icon(
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
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Password Reset Email Sent",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text("dineissam@gmail.com"),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Congratulations! your Account Awaits Verify Your Email yo Start Shopping and Experience a World of Unrivaled  ",
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const LoginPage()));
              },
              child: const MyButton(
                title: "Done",
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "Resend Email",
              style: TextStyle(color: Colors.blue),
            ),
          ],
        ),
      ),
    );
  }
}
