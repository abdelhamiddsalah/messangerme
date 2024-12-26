import 'package:flutter/material.dart';

class ButtonInWlcomeview extends StatelessWidget {
  const ButtonInWlcomeview({
    super.key, required this.text, required this.color, this.onPressed,
  });
  final String text;
  final Color color;
  final  void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      color: color,
      borderRadius: BorderRadius.circular(13),
      child: MaterialButton(onPressed: onPressed,
      child: Text(text, style: TextStyle(color: Colors.white),),
      ),
    );
  }
}