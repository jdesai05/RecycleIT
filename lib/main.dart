import 'package:flutter/material.dart';
import 'screens/LoginForm.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure Flutter is initialized first
  await Firebase.initializeApp(); // Then initialize Firebase
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Trash Detection App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green), // Set a green theme
        useMaterial3: true,
      ),
      home: LoginForm(), // Set LoginForm as the home screen
    );
  }
}
