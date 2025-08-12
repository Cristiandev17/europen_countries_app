import 'package:flutter/material.dart';

class CustomListEmpty extends StatelessWidget {
  final String message;
  final double fontSize;
  final Color color;
  final Function? onRetry;
  const CustomListEmpty({super.key, required this.message, required this.fontSize, required this.color, this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(message, style: TextStyle(fontSize: fontSize.toDouble(), color: color), textAlign: TextAlign.center),
            IconButton(icon: const Icon(Icons.refresh), onPressed: () => onRetry?.call(), tooltip: 'Retry'),
          ],
        ),
      ),
    );
  }
}
