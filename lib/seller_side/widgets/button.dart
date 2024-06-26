// import 'package:flutter/material.dart';

// class CustomElevatedButton extends StatelessWidget {
//   final String text;
//   final VoidCallback onPressed;
//   final Color color;
//   final TextStyle textStyle;
//   final double borderRadius;

//   CustomElevatedButton({
//     required this.text,
//     required this.onPressed,
//     this.color = Colors.blue,
//     this.textStyle = const TextStyle(color: Colors.white),
//     this.borderRadius = 8.0,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       style: ElevatedButton.styleFrom(
//         primary: color,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(borderRadius),
//         ),
//         padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//       ),
//       onPressed: onPressed,
//       child: Text(
//         text,
//         style: textStyle,
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color color;
  final Color fontcolor;
  final Function onPressed;
  final double width; // Add a width parameter

  const CustomButton({super.key, 
    required this.text,
    required this.color,
    required this.fontcolor,
    required this.onPressed,
    this.width = 400.0, // Default width
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width, // Set the width of the button
      child: ElevatedButton(
        onPressed: () => onPressed(),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: fontcolor,
          ),
        ),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(35),
          ),
          backgroundColor: color,
          padding: EdgeInsets.symmetric(vertical: 12), // Set vertical padding only
        ),
      ),
    );
  }
}

// Color.fromARGB(255, 16, 192, 232)