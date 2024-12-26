import 'package:flutter/material.dart';

class Rowtexts extends StatelessWidget {
  const Rowtexts({super.key, this.onPressed, required this.text1, required this.text2});
final  void Function()? onPressed;
final String text1;
final String text2;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text2, style: TextStyle(color: Colors.grey[700]),),
        TextButton(onPressed: onPressed, child: Text(text1, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),),
      ],
    );
  }
}