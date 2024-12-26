import 'package:flutter/material.dart';

class TextfieldItem extends StatelessWidget {
  const TextfieldItem({super.key, required this.text});
 final String text;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.black,
      style: const TextStyle(color: Colors.black),
      keyboardType: TextInputType.emailAddress,
      controller: TextEditingController(),
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