import 'package:flutter/material.dart';
import 'package:messangerme/views/widgets/button_in_welcome_view.dart';
import 'package:messangerme/views/widgets/rowtexts.dart';
import 'package:messangerme/views/widgets/textfield_item.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          child: Column(
             crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo (1).png',
                width: screenWidth * 0.5, // 50% of screen width
                height: screenHeight * 0.25, // 25% of screen height
              ),
              SizedBox(height: screenHeight * 0.02), // 2% of screen height
              TextfieldItem(text: 'Email',),
              SizedBox(height: screenHeight * 0.02), // 2% of screen height
              TextfieldItem(text: 'Password',),
              SizedBox(height: screenHeight * 0.02), // 2% of screen height
              ButtonInWlcomeview(text: 'Login', color: Colors.orange,),
              SizedBox(height: screenHeight * 0.02), // 2% of screen height
              Rowtexts(text2: 'Don\'t have an account?', text1: 'Signup',onPressed: () {
                Navigator.pushNamed(context, 'register');
              },),
            ],
          ),
        ),
      ),
    );
  }
}
