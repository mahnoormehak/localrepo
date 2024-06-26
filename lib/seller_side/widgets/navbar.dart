import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:localrepo/chat/chat_screen.dart';
import 'package:localrepo/seller_side/screens/analytics/analytics.dart';
import 'package:localrepo/seller_side/screens/homescreen/home.dart';
import 'package:localrepo/seller_side/screens/inventory/managment.dart';
import 'package:localrepo/seller_side/screens/profile/profile_screen.dart';
import 'package:localrepo/seller_side/utils/colors.dart';
import 'package:localrepo/user_side/constants.dart';
import 'package:localrepo/user_side/getx_logic/navigator_cont.dart';
import 'package:localrepo/user_side/sidebar/sidebar_screen.dart';


// class NavBarScreen extends StatefulWidget {
//   @override
//   _NavBarScreenState createState() => _NavBarScreenState();
// }

// class _NavBarScreenState extends State<NavBarScreen> {
//   int _selectedIndex = 0;

//   static List<Widget> _pages = <Widget>[
//     HomePage(),
//     ManagementScreen(),
//        AdvancedAnalyticsScreen(
//       liveData: DataProvider.fetchLiveData(),
//       salesData: DataProvider.fetchSalesData(),
//     ),
//     MessagesPage(),
//     Profile(),
//   ];

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _pages[_selectedIndex],
//       bottomNavigationBar: Container(
//         color: AppColors.btncolor,
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
//           child: GNav(
//             backgroundColor: AppColors.btncolor,
//             color: Colors.white,
//             activeColor: Colors.white,
//             tabBackgroundColor: const Color.fromARGB(255, 42, 219, 242),
//             gap: 8,
//             padding: const EdgeInsets.all(16.0), // navigation bar padding
//             selectedIndex: _selectedIndex, // Ensure the selected index is updated
//             onTabChange: _onItemTapped, // Handle tab change
//             tabs: const [
//               GButton(
//                 icon: LineIcons.home,
//                 text: 'Home',
//                 iconSize: 35,
//               ),
//               GButton(
//                 icon: LineIcons.sellcast,
//                 iconSize: 35,
//                 text: 'Tools',
//               ),
//               GButton(
//                 icon: LineIcons.cashRegister,
//                 text: 'Data',
//                 iconSize: 35,
//               ),
//               GButton(
//                 icon: LineIcons.envelope,
//                 text: 'Messages',
//                 iconSize: 35,
//               ),
//               GButton(
//                 icon: LineIcons.user,
//                 text: 'Profile',
//                 iconSize: 35,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }







class MessagesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Messages Page', style: TextStyle(fontSize: 24)),
    );
  }
}

// class MePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text('Me Page', style: TextStyle(fontSize: 24)),
//     );
//   }
// }
const Color inActiveIconColor = Color(0xFFB6B6B6);

class NavBarScreen extends StatelessWidget {
  const NavBarScreen({Key? key}) : super(key: key);
  static String routeName = "/";

  @override
  Widget build(BuildContext context) {
    final NavController navController = Get.find<NavController>();

    final List<Widget> pages = [
      //HomePage(),
      ManagementScreen(),
      AdvancedAnalyticsScreen(
        liveData: DataProvider.fetchLiveData(),
        salesData: DataProvider.fetchSalesData(),
      ),
      ChatScreen(sellerName: 'Anglena',),
      ProfileScreen(),
    ];

    return Obx(
      () => Scaffold(
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
              icon: SizedBox(
                width: 30,  // Specify the desired width
                height: 30, // Specify the desired height
                child: SvgPicture.asset(
                  "assets/icons/Shop Icon.svg",
                  color: inActiveIconColor,
                ),
              ),
              activeIcon: SizedBox(
                width: 30,  // Specify the desired width
                height: 30, // Specify the desired height
                child: SvgPicture.asset(
                  "assets/icons/Shop Icon.svg",
                  color: kPrimaryColor,
                ),
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: SizedBox(
                width: 30,  // Specify the desired width
                height: 30, // Specify the desired height
                child: SvgPicture.asset(
                  "assets/icons/analytics.svg",
                  color: inActiveIconColor,
                ),
              ),
              activeIcon: SizedBox(
                width: 30,  // Specify the desired width
                height: 30, // Specify the desired height
                child: SvgPicture.asset(
                  "assets/icons/analytics.svg",
                  color: kPrimaryColor,
                ),
              ),
              label: "Fav",
            ),
            BottomNavigationBarItem(
              icon: SizedBox(
                width: 30,  // Specify the desired width
                height: 30, // Specify the desired height
                child: SvgPicture.asset(
                  "assets/icons/Chat bubble Icon.svg",
                  color: inActiveIconColor,
                ),
              ),
              activeIcon: SizedBox(
                width: 30,  // Specify the desired width
                height: 30, // Specify the desired height
                child: SvgPicture.asset(
                  "assets/icons/Chat bubble Icon.svg",
                  color: kPrimaryColor,
                ),
              ),
              label: "Chat",
            ),
            BottomNavigationBarItem(
              icon: SizedBox(
                width: 30,  // Specify the desired width
                height: 30, // Specify the desired height
                child: SvgPicture.asset(
                  "assets/icons/User Icon.svg",
                  color: inActiveIconColor,
                ),
              ),
              activeIcon: SizedBox(
                width: 30,  // Specify the desired width
                height: 30, // Specify the desired height
                child: SvgPicture.asset(
                  "assets/icons/User Icon.svg",
                  color: kPrimaryColor,
                ),
              ),
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}
