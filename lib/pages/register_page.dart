
import 'package:auth_app/pages/login_page.dart';
import 'package:auth_app/pages/verify_email_page.dart';
import 'package:auth_app/utils/my_button.dart';
import 'package:auth_app/utils/my_circle.dart';
import 'package:auth_app/utils/my_password_text_field.dart';
import 'package:auth_app/utils/my_snack_bar.dart';
import 'package:auth_app/utils/my_text_field.dart';

import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _firstNameController = TextEditingController();

  final TextEditingController _lastNameController = TextEditingController();

  final TextEditingController _userNameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _phoneNumberController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  bool iAgree = false;
  final MySnackBar mySnackBar = MySnackBar();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const LoginPage()));
            },
            child: const Icon(Icons.arrow_back)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Let's create your account",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: MyTextField(
                        controller: _firstNameController,
                        hintText: "First Name",
                        icon: Icons.person_outline,
                        icon1: null),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: MyTextField(
                        controller: _lastNameController,
                        hintText: "Last Name",
                        icon: Icons.person_outline,
                        icon1: null),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              MyTextField(
                  controller: _userNameController,
                  hintText: "Username",
                  icon: Icons.person_add_alt,
                  icon1: null),
              const SizedBox(
                height: 15,
              ),
              MyTextField(
                  controller: _emailController,
                  hintText: "E-Mail",
                  icon: Icons.email_outlined,
                  icon1: null),
              const SizedBox(
                height: 15,
              ),
              MyTextField(
                  controller: _phoneNumberController,
                  hintText: "Phone Number",
                  icon: Icons.phone_outlined,
                  icon1: null),
              const SizedBox(
                height: 15,
              ),
              MyPasswordTextField(controller: _passwordController),
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
                          value: iAgree,
                          onChanged: (value) {
                            setState(() {
                              iAgree = value!;
                            });
                          },
                          checkColor: Colors.white,
                          activeColor: Colors.blue,
                        ),
                        RichText(
                          text: TextSpan(
                              text: "I agree to ",
                              style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary),
                              children: const <TextSpan>[
                                TextSpan(
                                    text: "Privacy Policy",
                                    style: TextStyle(
                                        color: Colors.blue,
                                        decoration: TextDecoration.underline)),
                                TextSpan(text: " and "),
                                TextSpan(
                                    text: "Terms of use",
                                    style: TextStyle(
                                        color: Colors.blue,
                                        decoration: TextDecoration.underline)),
                              ]),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                  onTap: () {
                    if (_emailController.text.isEmpty ||
                        _firstNameController.text.isEmpty ||
                        _lastNameController.text.isEmpty ||
                        _userNameController.text.isEmpty ||
                        _phoneNumberController.text.isEmpty ||
                        _passwordController.text.isEmpty) {
                      mySnackBar.showSnackBar(
                          context, "Please fill all fields ");
                    } else if (!iAgree) {
                      mySnackBar.showSnackBar(context,
                          "Please agree to Privacy Policy and Terms of Use");
                    } else {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const VerifyEmailPage()));
                    }
                  },
                  child: const MyButton(
                    title: "Create Account",
                  )),
              const SizedBox(
                height: 30,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Divider(
                        color: Colors.grey,
                        thickness: 0.3,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text("Or Sign up With"),
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.grey,
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
    );
  }
}
