import 'package:auth_app/firebase_options.dart';
import 'package:auth_app/services/auth/auth_gate.dart';
import 'package:auth_app/services/database/database_provider.dart';
import 'package:auth_app/themes/theme_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MultiProvider(
    providers: [
      // Theme provider
      ChangeNotifierProvider(create: (context) => ThemeProvider()),

      // Database provider
      ChangeNotifierProvider(create: (context) => DatabaseProvider())
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          themeMode: ThemeMode.system, // Use system theme mode
          debugShowCheckedModeBanner: false,
          home: AuthGate(),
          theme: themeProvider.themeData,
        );
      },
    );
  }
}
