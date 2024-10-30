import 'package:flutter/material.dart';
class TitleText extends StatelessWidget {
  const TitleText({
    super.key, required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(title,style: const TextStyle(fontWeight: FontWeight.w500,fontSize: 18,color: Colors.white),);
  }
}
