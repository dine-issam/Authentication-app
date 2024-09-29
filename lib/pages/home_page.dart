import 'package:auth_app/services/auth/auth_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center,children: [
        IconButton(onPressed: () {AuthService().logout();  },icon: const Icon(Icons.logout),)
      ],),
    );
  }
}
