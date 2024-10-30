import 'package:flutter/material.dart';

class LightText extends StatelessWidget {
  const LightText({
    super.key, required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(text,style:  TextStyle(color: Colors.white.withOpacity(0.8),fontSize: 17));
  }
}
