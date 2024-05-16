import 'package:flutter/material.dart';
import 'package:localrepo/cart/cart_screen.dart';
import 'package:localrepo/contract_page/contract_page.dart';
import 'package:localrepo/details/details_screen.dart';
import 'package:localrepo/favorite/favorite_screen.dart';
import 'package:localrepo/homescreens/home_screen.dart';
import 'package:localrepo/homescreens/popular_product.dart';
import 'package:localrepo/homescreens/special_offers.dart';
import 'package:localrepo/init_screen.dart';
import 'package:localrepo/login%20screens/login.dart';

import 'package:localrepo/onboarding_content/onboarding/screens/onboarding.dart';
import 'package:localrepo/login%20screens/signUP.dart';
import 'package:localrepo/products/products_screen.dart';
import 'package:localrepo/rental_agreement/agreement_screen.dart';
import 'package:localrepo/sidebar/sidebar_screen.dart';

class AppRoutes {
  static const String onboarding = '/onboarding';
  static String routeName = "/"; // init screen
  static const String signUp = '/signup';
  static const String logIn = '/login';
  static const String home = '/home';
  static const String products = "/products";
  static const String profile = '/profile'; // Add profile route
  static const String favorite = '/favorite'; // Add favorite route
  static const String popularProducts =
      '/popular_products'; // Add popular products route
  static const String specialOffers =
      '/special_offers'; // Add special offers route
  static const String rentalAgreement =
      '/rental_agreement'; // Add rental agreement route
  static const String details = '/details';
  static const String sidebar = '/sidebar';
  static const String contract = '/contract';
  static const String cart = '/cart';

  static final Map<String, WidgetBuilder> appRoutes = {
    InitScreen.routeName: (context) => const InitScreen(),
    onboarding: (context) => const OnboardingScreen(),
    signUp: (context) => const signup(),
    logIn: (context) => const LOGIN(),
    home: (context) => const HomeScreen(),
    products: (context) => const ProductsScreen(),
    favorite: (context) => const FavoriteScreen(),
    popularProducts: (context) => const PopularProducts(),
    specialOffers: (context) => const SpecialOffers(),
    rentalAgreement: (context) =>
        const RentalAgreementScreen(deviceName: '', rentAmount: 0),
    details: (context) {
      final args =
          ModalRoute.of(context)!.settings.arguments as ProductDetailsArguments;
      return DetailsScreen(args: args);
    },
    sidebar: (context) => const Sidebar(),
    contract: (context) => const ContractPage(),
    cart: (context) => const CartScreen(),
  };
}
