import 'package:auth_app/pages/forget_password_page.dart';
import 'package:auth_app/pages/home_page.dart';
import 'package:auth_app/pages/register_page.dart';

import 'package:auth_app/utils/my_button.dart';
import 'package:auth_app/utils/my_circle.dart';
import 'package:auth_app/utils/my_password_text_field.dart';
import 'package:auth_app/utils/my_snack_bar.dart';
import 'package:auth_app/utils/my_text_field.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();
  bool rememberMe = false;
  bool showPassword = false;
  final MySnackBar mySnackBar = MySnackBar();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 25, bottom: 20),
                  child: Image.asset(

                    "assets/images/logo.png",
                    
                    width: 80,
                  ),
                ),
                Text(
                  "Welcome back,",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Theme.of(context).colorScheme.primary),
                ),
                Text(
                  "Discover Limitless Choices and Unmatched\nConvenience.",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Theme.of(context).colorScheme.secondary),
                ),
                const SizedBox(
                  height: 30,
                ),
                MyTextField(
                  controller: _emailController,
                  hintText: "E-Mail",
                  icon: Icons.email_outlined,
                  icon1: null,
                ),
                const SizedBox(
                  height: 20,
                ),
                MyPasswordTextField(
                  controller: _passwordController,
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            value: rememberMe,
                            onChanged: (value) {
                              setState(() {
                                rememberMe = value!;
                              });
                            },
                            checkColor: Colors.white,
                            activeColor: Colors.blue,
                          ),
                          Text(
                            "Remember Me",
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.secondary),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ForgetPasswordPage()));
                        },
                        child: const Text(
                          "Forger Password?",
                          style: TextStyle(color: Colors.blue),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () {
                    if (_emailController.text.isEmpty ||
                        _passwordController.text.isEmpty) {
                      mySnackBar.showSnackBar(
                          context, "Please fill all fields ");
                    } else {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomePage()));
                    }
                  },
                  child: const MyButton(
                    title: "Sign In",
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RegisterPage()));
                  },
                  child: Container(
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 0.5,
                            color: Theme.of(context).colorScheme.primary),
                        borderRadius: BorderRadius.circular(12)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Create Account",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.primary),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                 Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Divider(
                          color: Theme.of(context).colorScheme.secondary,
                          thickness: 0.3,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text("Or Sign in With"),
                      ),
                      Expanded(
                        child: Divider(
                          color: Theme.of(context).colorScheme.secondary,
                          thickness: 0.3,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MyCircle(
                      imagePath: "assets/images/google.png",
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    MyCircle(
                      imagePath: "assets/images/facebook.png",
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
