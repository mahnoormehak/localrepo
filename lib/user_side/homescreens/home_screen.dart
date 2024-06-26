import 'package:flutter/material.dart';
import 'package:localrepo/user_side/homescreens/Carousel_slider.dart';
import 'package:localrepo/user_side/homescreens/home_header.dart';
import 'package:localrepo/user_side/homescreens/popular_product.dart';
import 'package:localrepo/user_side/homescreens/special_offers.dart';
import 'package:localrepo/user_side/sidebar/sidebar_screen.dart';
class HomeScreen extends StatelessWidget {
  static String routeName = "/home";

  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      drawer: const Sidebar(), // Ensure the Sidebar is here
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
