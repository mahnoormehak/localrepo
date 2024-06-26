import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:localrepo/chat/sellerlist.dart';
import 'package:localrepo/constants_copy.dart';
import 'package:localrepo/favorite/favorite_screen.dart';
import 'package:localrepo/getx_logic/navigator_cont.dart';
import 'package:localrepo/homescreens/home_screen.dart';
import 'package:localrepo/profile/profile_screen.dart';
import 'package:localrepo/chat/model/chatUser.dart';

const Color inActiveIconColor = Color(0xFFB6B6B6);

class InitScreen extends StatelessWidget {
  const InitScreen({super.key});
  static String routeName = "/";

  @override
  Widget build(BuildContext context) {
    final NavController navController = Get.find<NavController>();

    // Example list of sellers
    final List<ChatUser> sellers = [
      ChatUser(
        id: '1',
        name: 'Seller 1',
        image: 'https://example.com/image1.jpg',
        lastActive: 'Last Active: 1 hour ago',
        isOnline: true,
      ),
      ChatUser(
        id: '2',
        name: 'Seller 2',
        image: 'https://example.com/image2.jpg',
        lastActive: 'Last Active: 2 hours ago',
        isOnline: false,
      ),
    ];

    final List<Widget> pages = [
      const HomeScreen(),
      const FavoriteScreen(),
      SellersListScreen(
        sellers: sellers,
        sellerName: '',
      ), // Pass the list of sellers here
      const Profile(),
    ];

    return Obx(
      () => Scaffold(
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
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';
// import 'package:localrepo/chat/sellerlist.dart';
// import 'package:localrepo/constants_copy.dart';
// import 'package:localrepo/favorite/favorite_screen.dart';
// import 'package:localrepo/getx_logic/navigator_cont.dart';
// import 'package:localrepo/homescreens/home_screen.dart';
// import 'package:localrepo/profile/profile_screen.dart';
// import 'package:localrepo/chat/model/chatUser.dart';

// const Color inActiveIconColor = Color(0xFFB6B6B6);

// class InitScreen extends StatelessWidget {
//   const InitScreen({super.key});
//   static String routeName = "/";

//   @override
//   Widget build(BuildContext context) {
//     final NavController navController = Get.find<NavController>();

//     // Example list of sellers
//     final List<ChatUser> sellers = [
//       ChatUser(
//         id: '1',
//         name: 'Seller 1',
//         image: 'https://example.com/image1.jpg',
//         lastActive: 'Last Active: 1 hour ago',
//         isOnline: true,
//       ),
//       ChatUser(
//         id: '2',
//         name: 'Seller 2',
//         image: 'https://example.com/image2.jpg',
//         lastActive: 'Last Active: 2 hours ago',
//         isOnline: false,
//       ),
//     ];

//     final List<Widget> pages = [
//       const HomeScreen(),
//       const FavoriteScreen(),
//       SellersListScreen(
//         sellers: sellers,
//         sellerName: '',
//       ), // Pass the list of sellers here
//       const Profile(),
//     ];

//     return Obx(
//       () => Scaffold(
//         body: pages[navController.currentIndex.value],
//         bottomNavigationBar: BottomNavigationBar(
//           onTap: (index) => navController.changePage(index),
//           currentIndex: navController.currentIndex.value,
//           showSelectedLabels: false,
//           showUnselectedLabels: false,
//           type: BottomNavigationBarType.fixed,
//           items: [
//             BottomNavigationBarItem(
//               icon: SvgPicture.asset(
//                 "assets/icons/Shop Icon.svg",
//                 color: inActiveIconColor,
//               ),
//               activeIcon: SvgPicture.asset(
//                 "assets/icons/Shop Icon.svg",
//                 color: kPrimaryColor,
//               ),
//               label: "Home",
//             ),
//             BottomNavigationBarItem(
//               icon: SvgPicture.asset(
//                 "assets/icons/Heart Icon.svg",
//                 color: inActiveIconColor,
//               ),
//               activeIcon: SvgPicture.asset(
//                 "assets/icons/Heart Icon.svg",
//                 color: kPrimaryColor,
//               ),
//               label: "Fav",
//             ),
//             BottomNavigationBarItem(
//               icon: SvgPicture.asset(
//                 "assets/icons/Chat bubble Icon.svg",
//                 color: inActiveIconColor,
//               ),
//               activeIcon: SvgPicture.asset(
//                 "assets/icons/Chat bubble Icon.svg",
//                 color: kPrimaryColor,
//               ),
//               label: "Chat",
//             ),
//             BottomNavigationBarItem(
//               icon: SvgPicture.asset(
//                 "assets/icons/User Icon.svg",
//                 color: inActiveIconColor,
//               ),
//               activeIcon: SvgPicture.asset(
//                 "assets/icons/User Icon.svg",
//                 color: kPrimaryColor,
//               ),
//               label: "Profile",
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';
// import 'package:localrepo/chat/sellerlist.dart';
// import 'package:localrepo/constants_copy.dart';
// import 'package:localrepo/favorite/favorite_screen.dart';
// import 'package:localrepo/getx_logic/navigator_cont.dart';
// import 'package:localrepo/homescreens/home_screen.dart';
// import 'package:localrepo/profile/profile_screen.dart';

// const Color inActiveIconColor = Color(0xFFB6B6B6);

// class InitScreen extends StatelessWidget {
//   const InitScreen({super.key});
//   static String routeName = "/";

//   @override
//   Widget build(BuildContext context) {
//     final NavController navController = Get.find<NavController>();

//     final List<Widget> pages = [
//       const HomeScreen(),
//       const FavoriteScreen(),
//       SellersListScreen(sellerName:
//               "Seller Name"),// Provide a default seller name or handle this dynamically
//       const Profile(),
//     ];

//     return Obx(
//       () => Scaffold(
//         // Removed the AppBar title here
//         body: pages[navController.currentIndex.value],
//         bottomNavigationBar: BottomNavigationBar(
//           onTap: (index) => navController.changePage(index),
//           currentIndex: navController.currentIndex.value,
//           showSelectedLabels: false,
//           showUnselectedLabels: false,
//           type: BottomNavigationBarType.fixed,
//           items: [
//             BottomNavigationBarItem(
//               icon: SvgPicture.asset(
//                 "assets/icons/Shop Icon.svg",
//                 color: inActiveIconColor,
//               ),
//               activeIcon: SvgPicture.asset(
//                 "assets/icons/Shop Icon.svg",
//                 color: kPrimaryColor,
//               ),
//               label: "Home",
//             ),
//             BottomNavigationBarItem(
//               icon: SvgPicture.asset(
//                 "assets/icons/Heart Icon.svg",
//                 color: inActiveIconColor,
//               ),
//               activeIcon: SvgPicture.asset(
//                 "assets/icons/Heart Icon.svg",
//                 color: kPrimaryColor,
//               ),
//               label: "Fav",
//             ),
//             BottomNavigationBarItem(
//               icon: SvgPicture.asset(
//                 "assets/icons/Chat bubble Icon.svg",
//                 color: inActiveIconColor,
//               ),
//               activeIcon: SvgPicture.asset(
//                 "assets/icons/Chat bubble Icon.svg",
//                 color: kPrimaryColor,
//               ),
//               label: "Chat",
//             ),
//             BottomNavigationBarItem(
//               icon: SvgPicture.asset(
//                 "assets/icons/User Icon.svg",
//                 color: inActiveIconColor,
//               ),
//               activeIcon: SvgPicture.asset(
//                 "assets/icons/User Icon.svg",
//                 color: kPrimaryColor,
//               ),
//               label: "Profile",
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
