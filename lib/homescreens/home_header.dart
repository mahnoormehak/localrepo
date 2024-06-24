import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Import Get for navigation

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                hintText: "Search product",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(28),
                  borderSide: const BorderSide(color: Colors.transparent),
                  gapPadding: 10,
                ),
                filled: true,
                fillColor: Colors.grey[200],
                prefixIcon: const Icon(Icons.search),
              ),
            ),
          ),
          const SizedBox(width: 10),
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Get.toNamed('/cart'); // Using GetX for navigation
            },
          ),
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              Get.toNamed('/notifications'); // Navigation to notifications page
            },
          ),
        ],
      ),
    );
  }
}


// import 'package:flutter/material.dart';

// class HomeHeader extends StatelessWidget {
//   const HomeHeader({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
//       child: Row(
//         children: <Widget>[
//           Expanded(
//             child: TextField(
//               decoration: InputDecoration(
//                 contentPadding:
//                     const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
//                 hintText: "Search product",
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(28),
//                   borderSide: const BorderSide(color: Colors.transparent),
//                   gapPadding: 10,
//                 ),
//                 filled: true,
//                 fillColor: Colors.grey[200],
//                 prefixIcon: const Icon(Icons.search),
//               ),
//             ),
//           ),
//           const SizedBox(width: 10),
//           IconButton(
//             icon: const Icon(Icons.shopping_cart),
//             onPressed: () {
//               Navigator.pushNamed(context, '/cart');
//               // Add navigation to cart page
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }

