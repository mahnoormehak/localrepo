// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:localrepo/constants_copy.dart';
import 'package:localrepo/favorite/favorite_screen.dart';
import 'package:localrepo/homescreens/home_screen.dart';
import 'package:localrepo/profile/profile_screen.dart';
// import 'package:shop_app/constants.dart';
// import 'package:shop_app/screens/favorite/favorite_screen.dart';
// import 'package:shop_app/screens/home/home_screen.dart';
// import 'package:shop_app/screens/profile/profile_screen.dart';

const Color inActiveIconColor = Color(0xFFB6B6B6);

class InitScreen extends StatefulWidget {
  const InitScreen({
    super.key,
  });

  static String routeName = "/";

  @override
  State<InitScreen> createState() => _InitScreenState();
}

class _InitScreenState extends State<InitScreen> {
  int currentSelectedIndex = 0;

  void updateCurrentIndex(int index) {
    setState(() {
      currentSelectedIndex = index;
    });
  }

  final List<Widget> pages = [
    const HomeScreen(),
    const FavoriteScreen(),
    const Center(
      child: Text("Chat"),
    ),
    const Profile(), // Replace Profile with your actual profile screen widget
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentSelectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: updateCurrentIndex,
        currentIndex: currentSelectedIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/Shop Icon.svg",
              color: inActiveIconColor,
            ),
            activeIcon: SvgPicture.asset(
              "assets/icons/Shop Icon.svg",
              color: kPrimaryColor,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/Heart Icon.svg",
              color: inActiveIconColor,
            ),
            activeIcon: SvgPicture.asset(
              "assets/icons/Heart Icon.svg",
              color: kPrimaryColor,
            ),
            label: "Fav",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/Chat bubble Icon.svg",
              color: inActiveIconColor,
            ),
            activeIcon: SvgPicture.asset(
              "assets/icons/Chat bubble Icon.svg",
              color: kPrimaryColor,
            ),
            label: "Chat",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/User Icon.svg",
              color: inActiveIconColor,
            ),
            activeIcon: SvgPicture.asset(
              "assets/icons/User Icon.svg",
              color: kPrimaryColor,
            ),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
