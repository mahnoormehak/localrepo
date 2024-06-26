import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:localrepo/user_side/cart/components/checkout_page.dart';
import 'package:localrepo/user_side/constants.dart';

class CheckoutCard extends StatelessWidget {
  final double totalPrice;

  const CheckoutCard({
    super.key,
    required this.totalPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 20,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, -15),
            blurRadius: 20,
            color: const Color(0xFFDADADA).withOpacity(0.15),
          )
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF5F6F9),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: SvgPicture.asset("assets/icons/receipt.svg"),
                ),
                const Spacer(),
                const Text("Add voucher code"),
                const SizedBox(width: 8),
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 12,
                  color: kTextColor,
                )
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Text.rich(
                    TextSpan(
                      text: "Total:\n",
                      children: [
                        TextSpan(
                          text: "\$$totalPrice",
                          style: const TextStyle(
                              fontSize: 16, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Get.to(const CheckoutPage());
                    },
                    child: const Text("Check Out"),
                  ),
                ),
              ],
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
// import 'package:localrepo/cart/components/checkout_page.dart';
// import 'package:localrepo/constants_copy.dart';

// class CheckoutCard extends StatelessWidget {
//   final double totalPrice;

//   const CheckoutCard({
//     Key? key,
//     required this.totalPrice,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(
//         vertical: 16,
//         horizontal: 20,
//       ),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: const BorderRadius.only(
//           topLeft: Radius.circular(30),
//           topRight: Radius.circular(30),
//         ),
//         boxShadow: [
//           BoxShadow(
//             offset: const Offset(0, -15),
//             blurRadius: 20,
//             color: const Color(0xFFDADADA).withOpacity(0.15),
//           )
//         ],
//       ),
//       child: SafeArea(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               children: [
//                 Container(
//                   padding: const EdgeInsets.all(10),
//                   height: 40,
//                   width: 40,
//                   decoration: BoxDecoration(
//                     color: const Color(0xFFF5F6F9),
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: SvgPicture.asset("assets/icons/receipt.svg"),
//                 ),
//                 const Spacer(),
//                 const Text("Add voucher code"),
//                 const SizedBox(width: 8),
//                 const Icon(
//                   Icons.arrow_forward_ios,
//                   size: 12,
//                   color: kTextColor,
//                 )
//               ],
//             ),
//             const SizedBox(height: 16),
//             Row(
//               children: [
//                 Expanded(
//                   child: Text.rich(
//                     TextSpan(
//                       text: "Total:\n",
//                       children: [
//                         TextSpan(
//                           text: "\$$totalPrice", // Use totalPrice here
//                           style: const TextStyle(
//                               fontSize: 16, color: Colors.black),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   child: ElevatedButton(
//                     onPressed: () {
//                       Get.to(() => CheckoutPage());
//                     },
//                     child: const Text("Check Out"),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
