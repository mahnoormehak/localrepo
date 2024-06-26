import 'package:flutter/material.dart';
import 'package:localrepo/user_side/components/product_card.dart';
import 'package:localrepo/user_side/details/details_screen.dart';
import 'package:localrepo/user_side/models/Product.dart';
import 'package:localrepo/user_side/products/products_screen.dart';
import 'section_title.dart';

import 'package:get/get.dart';

class PopularProducts extends StatelessWidget {
  static const String popularProducts = '/popular_products';
  const PopularProducts({super.key});

  @override
  Widget build(BuildContext context) {
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
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Column(
            children: [
              Row(
                children: [
                  ...List.generate(
                    demoProducts.length,
                    (index) {
                      if (demoProducts[index].isPopular) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: ProductCard(
                            product: demoProducts[index],
                            onPress: () => Navigator.pushNamed(
                              context,
                              DetailsScreen.routeName,
                              arguments: ProductDetailsArguments(
                                  product: demoProducts[index]),
                            ),
                          ),
                        );
                      }

                      return const SizedBox
                          .shrink(); // here by default width and height is 0
                    },
                  ),
                  const SizedBox(width: 20),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}

