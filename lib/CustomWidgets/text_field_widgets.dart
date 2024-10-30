import 'package:flutter/material.dart';

import '../Utils/Constant/colors.dart';

class TextFiledWidgets extends StatefulWidget {
  const TextFiledWidgets({
    super.key,
    required this.hintText,
    required this.prefixIcon,
    this.validator,
    this.controller,
    this.obscureText,
  });
  final String hintText;
  final IconData prefixIcon;
  final String? Function(String?)? validator; // Custom validator function
  final TextEditingController? controller;
  final bool? Function(bool?)? obscureText;

  @override
  State<TextFiledWidgets> createState() => _TextFiledWidgetsState();
}
bool _obscureText = false;
class _TextFiledWidgetsState extends State<TextFiledWidgets> {
  void _toggleVisibility() {
    setState(() {
      _obscureText = !_obscureText; // Toggle state
    });
  }
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: _obscureText,
      // controller: controller,
      validator: widget.validator,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        prefixIcon: Icon(widget.prefixIcon,color: Colors.white.withOpacity(0.6)),
        hintText: widget.hintText,
        hintStyle: TextStyle(color: Colors.white.withOpacity(0.6)),
        filled: true,
        fillColor: AColor.loginContainer,
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 1.2,color: Colors.white),
            borderRadius: BorderRadius.circular(10)
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 1.2,color: Colors.white),
            borderRadius: BorderRadius.circular(8)
        ),
      ),
    );
  }
}
