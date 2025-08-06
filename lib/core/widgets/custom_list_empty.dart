import 'package:flutter/material.dart';

class CustomListEmpty extends StatelessWidget {
  final String message;
  final double fontSize;
  final Color color;
  const CustomListEmpty({super.key, required this.message, required this.fontSize, required this.color});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(message, style: TextStyle(fontSize: fontSize.toDouble(), color: color), textAlign: TextAlign.center),
      ),
    );
  }
}
