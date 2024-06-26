// favorite_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:localrepo/user_side/components/product_card.dart';
import 'package:localrepo/user_side/getx_logic/favorite_cont.dart';
class FavoriteScreen extends StatelessWidget {
  static const String favorite = '/favorite';
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
 final FavoriteController troller = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorites"),
      ),
      body: SafeArea(
        child: Obx(
          () {
            if (troller.favoriteProducts.isEmpty) {
              return const Center(child: Text("No favorite items"));
            } else {
              return GridView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: troller.favoriteProducts.length,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 0.7,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 16,
                ),
                itemBuilder: (context, index) {
                  final product = troller.favoriteProducts[index];
                  return ProductCard(
                    product: product,
                    onPress: () {
                      // Handle product click
                    },
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
