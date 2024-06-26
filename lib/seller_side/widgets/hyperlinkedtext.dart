import 'package:flutter/material.dart';

class HyperlinkText extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color color;

  const HyperlinkText({
    required this.text,
    required this.onTap,
    this.color = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Text(
        text,
        style: TextStyle(
          color: color,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}