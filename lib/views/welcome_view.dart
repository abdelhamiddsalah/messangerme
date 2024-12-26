import 'package:flutter/material.dart';
import 'package:messangerme/views/widgets/button_in_welcome_view.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.05, // 5% of screen width
          vertical: screenHeight * 0.05, // 5% of screen height
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
             Text(
              'MessengerMe',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 40,
                color: Color(0xff2e386b),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: screenHeight * 0.02), // 2% of screen height
            ButtonInWlcomeview(text: 'Log In',color: Colors.orange,),
          SizedBox(height: screenHeight * 0.02), // 2% of screen height
          ButtonInWlcomeview(color: Colors.blue, text: 'Sign Up',),
          ],
        ),
      ),
    );
  }
}