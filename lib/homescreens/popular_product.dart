import 'package:flutter/material.dart';
import '../../../components/product_card.dart';
import '../../../models/Product.dart';
import '../../details/details_screen.dart';
import '../../products/products_screen.dart';
import 'section_title.dart';

class PopularProducts extends StatelessWidget {
  const PopularProducts({super.key});

  @override
  Widget build(BuildContext context) {
    // Create a list of popular products
    List<Product> popularProducts =
        demoProducts.where((product) => product.isPopular).toList();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SectionTitle(
            title: "Popular Products",
            press: () {
              Navigator.pushNamed(context, ProductsScreen.routeName);
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: popularProducts.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              childAspectRatio: 0.75,
            ),
            itemBuilder: (context, index) {
              return ProductCard(
                product: popularProducts[index],
                onPress: () => Navigator.pushNamed(
                  context,
                  DetailsScreen.routeName,
                  arguments:
                      ProductDetailsArguments(product: popularProducts[index]),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}




// import 'package:flutter/material.dart';
// import '../../../components/product_card.dart';
// import '../../../models/Product.dart';
// import '../../details/details_screen.dart';
// import '../../products/products_screen.dart';
// import 'section_title.dart';

// class PopularProducts extends StatelessWidget {
//   static const String popularProducts = '/popular_products';
//   const PopularProducts({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20),
//           child: SectionTitle(
//             title: "Popular Products",
//             press: () {
//               Navigator.pushNamed(context, ProductsScreen.routeName);
//             },
//           ),
//         ),
//         SingleChildScrollView(
//           scrollDirection: Axis.vertical, // Changed to vertical scrolling
//           child: Column(
//             children: [
//               ...List.generate(
//                 demoProducts.length,
//                 (index) {
//                   if (demoProducts[index].isPopular) {
//                     return Padding(
//                       padding: const EdgeInsets.symmetric(
//                           vertical: 10, horizontal: 20),
//                       child: ProductCard(
//                         product: demoProducts[index],
//                         onPress: () => Navigator.pushNamed(
//                           context,
//                           DetailsScreen.routeName,
//                           arguments: ProductDetailsArguments(
//                               product: demoProducts[index]),
//                         ),
//                       ),
//                     );
//                   }
//                   return const SizedBox.shrink();
//                 },
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }



// import 'package:flutter/material.dart';

// import '../../../components/product_card.dart';
// import '../../../models/Product.dart';
// import '../../details/details_screen.dart';
// import '../../products/products_screen.dart';
// import 'section_title.dart';

// class PopularProducts extends StatelessWidget {
//   static const String popularProducts = '/popular_products';
//   const PopularProducts({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20),
//           child: SectionTitle(
//             title: "Popular Products",
//             press: () {
//               Navigator.pushNamed(context, ProductsScreen.routeName);
//             },
//           ),
//         ),
//         SingleChildScrollView(
//           scrollDirection: Axis.horizontal,
//           child: Column(
//             children: [
//               Row(
//                 children: [
//                   ...List.generate(
//                     demoProducts.length,
//                     (index) {
//                       if (demoProducts[index].isPopular) {
//                         return Padding(
//                           padding: const EdgeInsets.only(left: 20),
//                           child: ProductCard(
//                             product: demoProducts[index],
//                             onPress: () => Navigator.pushNamed(
//                               context,
//                               DetailsScreen.routeName,
//                               arguments: ProductDetailsArguments(
//                                   product: demoProducts[index]),
//                             ),
//                           ),
//                         );
//                       }

//                       return const SizedBox
//                           .shrink(); // here by default width and height is 0
//                     },
//                   ),
//                   const SizedBox(width: 20),
//                 ],
//               ),
//             ],
//           ),
//         )
//       ],
//     );
//   }
// }
