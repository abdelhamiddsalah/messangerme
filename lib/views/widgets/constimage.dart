import 'package:flutter/material.dart';

class ConstImage extends StatelessWidget {
  const ConstImage({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
  });

  final double screenWidth;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/logo (1).png',
      width: screenWidth * 0.5, // 50% of screen width
      height: screenHeight * 0.25, // 25% of screen height
    );
  }
}
