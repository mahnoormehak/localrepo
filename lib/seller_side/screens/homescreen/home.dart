import 'package:flutter/material.dart';
import 'package:localrepo/seller_side/widgets/appbar.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:CustomAppBar(
    title: 'Your Title',
    leadingIcon: Icons.arrow_back, // Add your leading icon here
    onLeadingTap: () {
      // Implement your back navigation logic here
      Navigator.of(context).pop();
    },
    appBarHeight: 70.0
  ), 
    );
  }
}















