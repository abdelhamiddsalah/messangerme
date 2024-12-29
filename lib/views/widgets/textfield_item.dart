import 'package:flutter/material.dart';

class TextfieldItem extends StatelessWidget {
  const TextfieldItem({super.key, required this.text, this.controller, this.keyboardType, this.validator});
 final String text;
 final TextEditingController? controller;
 final TextInputType? keyboardType;
 final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: text == 'Password' ? true : false,
      cursorColor: Colors.black,
      validator: validator,
      style: const TextStyle(color: Colors.black),
      keyboardType: TextInputType.emailAddress,
      controller: controller,
      decoration:  InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        filled: true,
        fillColor: Color(0xffe7edeb),
        hintStyle: TextStyle(color: Colors.grey),
        hintText: text,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(13)),
          borderSide: BorderSide(width: 0, style: BorderStyle.none),
        ),
      ), 
    );
  }
}