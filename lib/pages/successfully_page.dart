import 'package:auth_app/services/auth/auth_gate.dart';
import 'package:auth_app/utils/my_button.dart';
import 'package:flutter/material.dart';

class SuccessfullyPage extends StatelessWidget {
  const SuccessfullyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 40,
              ),
              Image.asset(
                "assets/images/successfully.png",
                scale: 1.5,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Your account successfully created!",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Congratulations! Your account awaits. Verify your email to start shopping and experience a world of unrivaled opportunities!",
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  // Navigate to HomePage after verification
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>  AuthGate(),
                    ),
                  );
                },
                child: const MyButton(
                  title: "Continue",
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
