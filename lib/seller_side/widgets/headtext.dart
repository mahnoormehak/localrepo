import 'package:flutter/material.dart';
import 'package:localrepo/seller_side/utils/colors.dart';

class HeadText extends StatelessWidget {
  final IconData? icon;
  final String text;
  final double fontSize;

  HeadText({
    this.icon,
    required this.text,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
    //  mainAxisSize: MainAxisSize.,
      children: [
        if (icon != null) ...[
          Icon(icon,
          size: 270,
          color: AppColors.btncolor,),
         // SizedBox(),  // Adjust spacing between icon and text as needed
        ],
        Text(
          text,
          style:TextStyle(fontSize: fontSize,
          fontFamily: 'Bebas_Neue',
          fontWeight: FontWeight.bold,
          color:AppColors.btncolor),
          
        ),
      ],
    );
  }
}
