import 'package:flutter/material.dart';

class MySnackBar {
  void showSnackBar(context, String title) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Colors.red,
      content: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    ));
  }
}
