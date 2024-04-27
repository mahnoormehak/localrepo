import 'package:flutter/material.dart';
import 'package:localrepo/Database/uploadScreen/sc2.dart';
import 'package:localrepo/Database/uploadScreen/screen1.dart';
import 'package:localrepo/cart/cart_screen.dart';
// import 'package:localrepo/cart/cart_screen.dart';
import 'package:localrepo/contract_page/contract_page.dart';
import 'package:localrepo/details/details_screen.dart';
import 'package:localrepo/favorite/favorite_screen.dart';
import 'package:localrepo/homescreens/home_screen.dart';
import 'package:localrepo/homescreens/popular_product.dart';
import 'package:localrepo/homescreens/special_offers.dart';
import 'package:localrepo/init_screen.dart';
import 'package:localrepo/login%20screens/login.dart';
// import 'package:localrepo/models/cart.dart';
import 'package:localrepo/onboarding_content/onboarding/screens/onboarding.dart';
import 'package:localrepo/login%20screens/signUP.dart';
import 'package:localrepo/login%20screens/LOGIN.dart';
import 'package:localrepo/products/products_screen.dart';
import 'package:localrepo/profile/profile_screen.dart';
import 'package:localrepo/rental_agreement/agreement_screen.dart';
import 'package:localrepo/sidebar/sidebar_screen.dart';

// Define route names as constants
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
  static const String upload1 = '/upload1';
  static const String upload2 = '/upload2';
}

// Define routes using a Map
final Map<String, WidgetBuilder> appRoutes = {
  InitScreen.routeName: (context) => const InitScreen(),
  AppRoutes.onboarding: (context) => const OnboardingScreen(),
  AppRoutes.signUp: (context) =>  signup(),
// AppRoutes.logIn: (context) => LOGIN(),
AppRoutes.upload1: (context) =>  UploadDeviceScreen(),
AppRoutes.upload2: (context) =>  uploadScreen1(),

  AppRoutes.home: (context) => const HomeScreen(),
  AppRoutes.products: (context) => const ProductsScreen(),
  //AppRoutes.profile: (context) => const ProfileScreen(), // Add profile route
  AppRoutes.favorite: (context) => const FavoriteScreen(), // Add favorite route
  AppRoutes.popularProducts: (context) =>
      const PopularProducts(), // Add popular products route
  AppRoutes.specialOffers: (context) =>
      const SpecialOffers(), // Add special offers route
  AppRoutes.rentalAgreement: (context) =>
       RentalAgreementScreen(deviceName: '', rentAmount: 0,), // Add rental agreement route
  AppRoutes.details: (context) => const DetailsScreen(),
  AppRoutes.sidebar: (context) => const Sidebar(),
  AppRoutes.contract: (context) => const ContractPage(),
  AppRoutes.cart: (context) => const CartScreen(),
};
