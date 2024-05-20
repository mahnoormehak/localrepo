import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({Key? key}) : super(key: key);

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
              Navigator.pushNamed(context, '/cart');
              // Add navigation to cart page
            },
          ),
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:localrepo/cart/cart_screen.dart';

// import 'icon_btn_with_counter.dart';
// import 'search_field.dart';

// class HomeHeader extends StatelessWidget {
//   const HomeHeader({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           const Expanded(child: SearchField()),
//           const SizedBox(width: 16),
//           IconBtnWithCounter(
//             svgSrc: "assets/icons/Cart Icon.svg",
//             press: () => Navigator.pushNamed(context, CartScreen.routeName),
//           ),
//           const SizedBox(width: 8),
//           IconBtnWithCounter(
//             svgSrc: "assets/icons/Bell.svg",
//             numOfitem: 3,
//             press: () {},
//           ),
//         ],
//       ),
//     );
//   }
// }
