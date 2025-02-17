import 'package:flutter/material.dart';
import 'package:recycleit/screens/LoginForm.dart';
import '../widgets/textfield.dart'; // Importing the reusable text field
import '../widgets/LoginButton.dart'; // Importing the reusable button

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign Up')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'Sign Up',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 40),
            RoundedTextField(hintText: 'Full Name'),
            SizedBox(height: 20),
            RoundedTextField(hintText: 'Email'),
            SizedBox(height: 20),
            RoundedTextField(hintText: 'Password', obscureText: true),
            SizedBox(height: 30),
            LoginButton(
              text: 'Sign Up',
              onPressed: () {
              },
            ),
            SizedBox(height: 20,),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginForm()));
              },
              child: Center(child: Text("Already have an account? Log In")))
          ],
        ),
      ),
    );
  }
}
