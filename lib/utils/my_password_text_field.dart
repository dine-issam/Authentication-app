import 'package:flutter/material.dart';

class MyPasswordTextField extends StatefulWidget {
  const MyPasswordTextField({
    super.key,
    required this.controller,
  });
  final TextEditingController controller;

  @override
  State<MyPasswordTextField> createState() => _MyPasswordTextFieldState();
}

class _MyPasswordTextFieldState extends State<MyPasswordTextField> {
  // Make showPassword a mutable state variable
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: !showPassword, // This will toggle the visibility of the password
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.password_outlined),
        hintText: "Password",
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              showPassword = !showPassword; // Toggle password visibility
            });
          },
          child: showPassword
              ? const Icon(Icons.remove_red_eye_outlined,color: Colors.grey,)
              : const Icon(Icons.visibility_off,color: Colors.grey,),
        ),
        hintStyle:  TextStyle(
          fontWeight: FontWeight.w500,
          color: Theme.of(context).colorScheme.primary,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide:  BorderSide(color: Theme.of(context).colorScheme.primary, width: 1.5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide:  BorderSide(color: Theme.of(context).colorScheme.primary, width: 0.3),
        ),
      ),
    );
  }
}
