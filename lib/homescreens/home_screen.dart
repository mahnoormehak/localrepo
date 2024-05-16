import 'package:flutter/material.dart';
import 'package:localrepo/homescreens/Carousel_slider.dart';
import 'package:localrepo/homescreens/home_header.dart';
import 'package:localrepo/homescreens/popular_product.dart';
import 'package:localrepo/homescreens/special_offers.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";

  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            children: [
              const HomeHeader(),
              MyCarouselSlider(),
              const SpecialOffers(),
              const SizedBox(height: 20),
              const PopularProducts(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
