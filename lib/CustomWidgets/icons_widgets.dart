import 'package:flutter/material.dart';

class IconWidget extends StatelessWidget {
  const IconWidget({
    super.key, required this.icon,
  });

  final IconData icon;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      height: height *0.04,
      width: width * 0.09,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.7),
          borderRadius: BorderRadius.circular(07),
          border: Border.all(color: Colors.white.withOpacity(0.4),width: 0.5)
      ),
      child: Center(
        child: Icon(icon,color: Colors.white),
      ),
    );
  }
}
