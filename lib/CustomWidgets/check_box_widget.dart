import 'package:flutter/material.dart';

class CheckBoxWidgets extends StatefulWidget {
  const CheckBoxWidgets({
    super.key,
  });


  @override
  State<CheckBoxWidgets> createState() => _CheckBoxWidgetsState();
}

class _CheckBoxWidgetsState extends State<CheckBoxWidgets> {
  bool isCheck = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        setState(() {
          isCheck = !isCheck; // Toggle the checkbox state
        });
      },
      child: Container(
        width: 28,  // Width of the checkbox
        height: 28, // Height of the checkbox
        decoration: BoxDecoration(
          color:Colors.black.withOpacity(0.3),
          // color: isCheck ? AColors. : Colors.transparent, // Fill color when checked
          borderRadius: BorderRadius.circular(08), // Slight rounding for square effect
          border: Border.all(
            color: Colors.white.withOpacity(0.2),
            width: 1.5, // Border thickness
          ),
        ),
        child: isCheck
            ? const Icon(
          Icons.check,
          size: 20,
          color: Colors.white, // Tick color
        )
            : null,
      ),
    );
  }
}