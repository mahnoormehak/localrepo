import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final Color? color;
  final double size;
  final double padding;
  final double borderRadius;
  final Color? backgroundColor;
  final String tooltip;

  CustomIconButton({
    required this.icon,
    required this.onPressed,
    this.color = Colors.white,
    this.size = 20.0,
    this.padding = 5.0,
    this.borderRadius = 8.0,
    this.backgroundColor = Colors.orange,
    this.tooltip = '',
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(borderRadius),
        splashColor: Colors.white.withOpacity(0.2),
        child: Tooltip(
          message: tooltip,
          child: Container(
            padding: EdgeInsets.all(padding),
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(borderRadius),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Icon(
              icon,
              color: color,
              size: size,
            ),
          ),
        ),
      ),
    );
  }
}