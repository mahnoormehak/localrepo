import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:localrepo/cart/cart_screen.dart';
import 'package:localrepo/chat/model/chatUser.dart';
import 'package:localrepo/chat/sellerlist.dart';
import 'package:localrepo/getx_logic/favorite_cont.dart';
import 'package:localrepo/models/Product.dart';
import 'package:localrepo/models/cart.dart';
import 'components/product_description.dart';
import 'components/product_images.dart';
import 'components/top_rounded_container.dart';

class DetailsScreen extends StatefulWidget {
  static String routeName = "/details";
  final ProductDetailsArguments args;

  const DetailsScreen({super.key, required this.args});

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  int rentalDays = 1;
  final FavoriteController favoriteController = Get.find();

  Future<void> _selectDate(BuildContext context) async {
    DateTimeRange? picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 1),
    );
    if (picked != null) {
      setState(() {
        rentalDays = picked.duration.inDays;
      });
    }
  }

  void _navigateToReviews(BuildContext context, Product product) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            ReviewsScreen(product: product), // Create a ReviewsScreen
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Product product = widget.args.product;
    double totalPrice = rentalDays * product.price;
    bool isFavorite = favoriteController.isFavorite(product);

    List<ChatUser> sellers = [
      ChatUser(
        id: '1',
        name: product.sellerName,
        image: 'https://example.com/seller_image.png',
        lastActive: DateTime.now().toIso8601String(),
        isOnline: true,
      ),
    ]; // Replace with actual list of sellers

    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: const Color(0xFFF5F6F9),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              padding: EdgeInsets.zero,
              elevation: 0,
              backgroundColor: Colors.white,
            ),
            child: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
              size: 20,
            ),
          ),
        ),
        actions: [
          Row(
            children: [
              GestureDetector(
                onTap: () => Get.to(() => ReviewsScreen(product: product)),
                child: Container(
                  margin: const EdgeInsets.only(right: 20),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Row(
                    children: [
                      const Text(
                        "4.9",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: 4),
                      SvgPicture.asset("assets/icons/Star Icon.svg"),
                    ],
                  ),
                ),
              ),
              IconButton(
                icon: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: isFavorite ? Colors.red : Colors.black,
                ),
                onPressed: () {
                  setState(() {
                    favoriteController.toggleFavorite(product);
                  });
                },
              ),
              // IconButton(
              //   icon: Icon(Icons.chat_bubble_outline),
              //   onPressed: () {
              //     Get.to(() => SellersListScreen(sellers: sellers));
              //   },
              // ),
            ],
          ),
        ],
      ),
      body: ListView(
        children: [
          ProductImages(product: product),
          TopRoundedContainer(
            color: Colors.white,
            child: Column(
              children: [
                ProductDescription(
                  product: product,
                  pressOnSeeMore: () => _navigateToReviews(
                      context, product), // Navigate to reviews screen
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "\$${product.price}/day",
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          const Text(
                            "Rental days:",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black54,
                            ),
                          ),
                          const SizedBox(width: 75),
                          Text(
                            "$rentalDays days",
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(width: 60),
                          ElevatedButton(
                            onPressed: () => _selectDate(context),
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.blueAccent,
                            ),
                            child: const Text("Select Dates"),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Total Price: \$${totalPrice.toStringAsFixed(2)}",
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Seller: ${product.sellerName}",
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black87,
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.chat_bubble_outline),
                            onPressed: () {
                              Get.to(() => SellersListScreen(
                                    sellers: sellers,
                                    sellerName: 'seller',
                                  ));
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: TopRoundedContainer(
        color: Colors.white,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            child: ElevatedButton(
              onPressed: () {
                demoCarts.add(Cart(product: product, numOfItem: rentalDays));
                Navigator.pushNamed(
                  context,
                  CartScreen.routeName,
                  arguments: rentalDays * product.price,
                );
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blueAccent,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text(
                "Add To Cart",
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ProductDetailsArguments {
  final Product product;

  ProductDetailsArguments({required this.product});
}
