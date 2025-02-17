import 'package:flutter/material.dart';
import 'screens/LoginForm.dart'; // Import the login form screen

void main() {
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
