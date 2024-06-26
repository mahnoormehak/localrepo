import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:localrepo/AI/icon.dart';
import 'package:localrepo/chat/chat_screen.dart';
import 'package:localrepo/user_side/constants.dart';
import 'package:localrepo/user_side/favorite/favorite_screen.dart';
import 'package:localrepo/user_side/getx_logic/navigator_cont.dart';
import 'package:localrepo/user_side/homescreens/home_screen.dart';
import 'package:localrepo/user_side/profile/profile_screen.dart';
import 'package:localrepo/user_side/sidebar/sidebar_screen.dart';

const Color inActiveIconColor = Color(0xFFB6B6B6);

class InitScreen extends StatelessWidget {
  const InitScreen({Key? key}) : super(key: key);
  static String routeName = "/";

  @override
  Widget build(BuildContext context) {
    final NavController navController = Get.find<NavController>();

    final List<Widget> pages = [
      const HomeScreen(),
      const FavoriteScreen(),
    ChatScreen(sellerName: "robert"),
      const Profile(),
    ];

    return Obx(
      () => Scaffold(
        // appBar: AppBar(
        //  // title: const Text("Init Screen"),
        // ),
        drawer: const Sidebar(),
        body: pages[navController.currentIndex.value],
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) => navController.changePage(index),
          currentIndex: navController.currentIndex.value,
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
        floatingActionButton: FloatingButton(), 
      ),
    );
  }
}
