import 'package:flutter/material.dart';

class DividerWidgets extends StatelessWidget {
  const DividerWidgets({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(border: Border(top: BorderSide(width: 0.5, color: Colors.grey.shade300))));
  }
}
