import 'package:flutter/material.dart';
import 'package:recycleit/screens/HomeScreen.dart';
import 'package:recycleit/screens/SignUp.dart';
import '../widgets/textfield.dart'; // Importing the reusable text field
import '../widgets/LoginButton.dart'; // Importing the reusable button

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'Login',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 40),
            RoundedTextField(hintText: 'Email'),
            SizedBox(height: 20),
            RoundedTextField(hintText: 'Password', obscureText: true),
            SizedBox(height: 30),
            LoginButton(
              text: 'Login',
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
            ),
            SizedBox(height: 20,),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp()));
              },
              child: Center(child: Text("Don't have an account? Signup")))
          ],
        ),
      ),
    );
  }
}
