import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:localrepo/getx_logic/favorite_cont.dart';
import 'package:localrepo/getx_logic/navigator_cont.dart';
import 'package:localrepo/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(FavoriteController()); // Initialize the FavoriteController
    Get.put(NavController()); // Initialize the NavController
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.onboarding, // Set initial route to InitScreen
      getPages: AppRoutes.getPages, // Define all your routes using GetX
    );
  }
}



// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:localrepo/getx_logic/favorite_cont.dart';
// import 'package:localrepo/getx_logic/navigator_cont.dart';
// import 'package:localrepo/routes.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     Get.put(FavoriteController()); // Initialize the FavoriteController
//     Get.put(NavController()); // Initialize the NavController
//     return GetMaterialApp(
//       debugShowCheckedModeBanner: false,
//       initialRoute: AppRoutes.home, // Set initial route to OnboardingScreen
//       getPages: AppRoutes.getPages, // Define all your routes using GetX
//     );
//   }
// }
