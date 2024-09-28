import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  const MyTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.icon,
      required this.icon1});
  final TextEditingController controller;
  final String hintText;
  final dynamic icon;
  final dynamic icon1;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
          prefixIcon:  Icon(icon),
          hintText: hintText,
          suffixIcon: Icon(icon1),
          hintStyle:
               TextStyle(fontWeight: FontWeight.w500, color: Theme.of(context).colorScheme.primary),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide:  BorderSide(color: Theme.of(context).colorScheme.primary, width: 1.5)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide:  BorderSide(color:Theme.of(context).colorScheme.primary, width: 0.3))),
    );
  }
}
