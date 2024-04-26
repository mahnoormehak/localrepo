// import 'package:flutter/material.dart';
// import 'package:localrepo/homescreens/sidebar.dart';
// // import 'package:localrepo/login%20screens/login.dart';
// // import 'package:localrepo/login%20screens/signUP.dart';
// import 'package:lottie/lottie.dart';
// import 'dart:async';
// import 'package:animated_text_kit/animated_text_kit.dart';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});

//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();

<<<<<<< HEAD
//     // Simulate some loading or initialization process
//     // You can replace this with your actual application logic
//     Timer(
//       const Duration(seconds: 4), // Set the duration of your splash screen
//       () {
//         // Navigate to the next screen after the splash screen
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) => const editScreen()),
//         );
//       },
//     );
//   }
=======
    // Simulate some loading or initialization process
    // You can replace this with your actual application logic
    Timer(
      Duration(seconds: 4), // Set the duration of your splash screen
      () {
        // Navigate to the next screen after the splash screen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) =>Profile ()),
        );
      },
    );
  }
>>>>>>> d34cf9279b94f2760c354f3b1da40a48d181d321

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // backgroundColor:Color.fromARGB(255, 0, 15, 48),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Lottie.asset(
//               "assets/lotties/cam.json",
//               height: 300.0,
//               width: 300.0,
//             ),
//             const SizedBox(height: 20),
//             AnimatedTextKit(
//               animatedTexts: [
//                 TyperAnimatedText(
//                   'EUISHARE LIVING',
//                   textStyle: const TextStyle(
//                     fontSize: 27,
//                     fontStyle: FontStyle.italic,
//                     fontWeight: FontWeight.bold,
//                     color: Color.fromARGB(255, 95, 67, 160),
//                   ),
//                 ),
//               ],
//             ),
//             const CircularProgressIndicator(),
//           ],
//         ),
//       ),
//     );
//   }
// }
