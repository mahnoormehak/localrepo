import 'package:get/get.dart';
import 'package:localrepo/routes.dart';
import 'package:localrepo/user_side/Database/uploadScreen/combine.dart';
import 'package:localrepo/user_side/Database/uploadScreen/image.dart';
import 'package:localrepo/user_side/Database/uploadScreen/productlist.dart';
import 'package:localrepo/user_side/Database/uploadScreen/screen1.dart';
import 'package:localrepo/user_side/cart/cart_screen.dart';
import 'package:localrepo/user_side/cart/components/check_out_card.dart';
import 'package:localrepo/user_side/cart/components/success_dialog.dart';
import 'package:localrepo/user_side/contract_page/contract_page.dart';
import 'package:localrepo/user_side/contract_page/installment.dart';
import 'package:localrepo/user_side/details/details_screen.dart';
import 'package:localrepo/user_side/favorite/favorite_screen.dart';
import 'package:localrepo/user_side/homescreens/popular_product.dart';
import 'package:localrepo/user_side/homescreens/special_offers.dart';
import 'package:localrepo/user_side/init_screen.dart';
import 'package:localrepo/user_side/login%20screens/IDcard.dart';
import 'package:localrepo/user_side/login%20screens/handleUser.dart';
import 'package:localrepo/user_side/login%20screens/login.dart';
import 'package:localrepo/user_side/login%20screens/signUP.dart';
import 'package:localrepo/user_side/onboarding_content/onboarding/screens/onboarding.dart';
import 'package:localrepo/user_side/products/products_screen.dart';
import 'package:localrepo/user_side/profile/profile_screen.dart';
import 'package:localrepo/user_side/rental_agreement/agreement_screen.dart';
import 'package:localrepo/user_side/sidebar/sidebar_screen.dart';

class AppRoutes {
  static const String onboarding = '/onboarding';
  static const String signUp = '/signup';
  static const String logIn = '/login';
  static const String home = '/home';
  static const String products = '/products';
  static const String favorite = '/favorite';
  static const String popularProducts = '/popular_products';
  static const String specialOffers = '/special_offers';
  static const String rentalAgreement = '/rental_agreement';
  static const String details = '/details';
  static const String sidebar = '/sidebar';
  static const String contract = '/contract';
  static const String cart = '/cart';
  static const String checkoutcard = '/checkoutcard';
  static const String checkout = '/checkout';
  static const String orderSuccess = '/order_success';
    static const String uploadimages = '/uploadimages';
      static const String uploadProducts = '/uploadProducts';
            static const String installment = '/installment';
    static const String combine = '/combine';
     static const String IDcard = '/IDcard';
       static const String profile = '/profile';
           static const String ListProducts = '/ListProducts';
             static const String sellimages = '/sellimages';
                static const String userData= '/userData';
  static final List<GetPage> getPages = [
    GetPage(name: onboarding, page: () => const OnboardingScreen()),
    GetPage(name: signUp, page: () => const signup()),
    GetPage(name: logIn, page: () => const LOGIN()),
    GetPage(name: IDcard, page: () =>  IdCardVerificationScreen()),
        GetPage(name: userData, page: () =>  UserHandleScreen()),

    GetPage(name: home, page: () => const InitScreen()),
        GetPage(name: profile, page: () => const Profile()),
          // GetPage(name: ListProducts, page: () =>  ProductListingPage()),
     //   GetPage(name: Rent, page: () =>  RentScreen()),
    GetPage(name: products, page: () => const ProductsScreen()),
    GetPage(name: favorite, page: () => const FavoriteScreen()),
    GetPage(name: popularProducts, page: () => const PopularProducts()),
    GetPage(name: specialOffers, page: () => const SpecialOffers()),
     GetPage(name: uploadimages, page: () =>  ImageSelectorPage()),
    GetPage(name: uploadProducts, page: () => const UploadDeviceScreen()),
    GetPage(name: installment, page: () =>  InstallmentScreen(deviceName: '', price: 0,)),
    GetPage(
      name: rentalAgreement,
      page: () => const RentalAgreementScreen(deviceName: '', rentAmount: 0),
    ),
    GetPage(
      name: details,
      page: () => DetailsScreen(args: Get.arguments),
    ),
    GetPage(name: sidebar, page: () => const Sidebar()),
    GetPage(name: contract, page: () => const ContractPage()),
    GetPage(name: cart, page: () => const CartScreen()),
    GetPage(
      name: checkoutcard,
      page: () => CheckoutCard(totalPrice: Get.arguments['totalPrice']),
    ),
    GetPage(name: orderSuccess, page: () => const OrderSuccessScreen()),
  ];
}

mixin userId {
}

mixin widget {
}




// import 'package:get/get.dart';
// import 'package:localrepo/cart/cart_screen.dart';
// import 'package:localrepo/contract_page/contract_page.dart';
// import 'package:localrepo/details/details_screen.dart';
// import 'package:localrepo/favorite/favorite_screen.dart';
// import 'package:localrepo/homescreens/home_screen.dart';
// import 'package:localrepo/homescreens/popular_product.dart';
// import 'package:localrepo/homescreens/special_offers.dart';
// import 'package:localrepo/init_screen.dart';
// import 'package:localrepo/login%20screens/login.dart';
// import 'package:localrepo/onboarding_content/onboarding/screens/onboarding.dart';
// import 'package:localrepo/login%20screens/signUP.dart';
// import 'package:localrepo/products/products_screen.dart';
// import 'package:localrepo/rental_agreement/agreement_screen.dart';
// import 'package:localrepo/sidebar/sidebar_screen.dart';

// class AppRoutes {
//   static const String onboarding = '/onboarding';
//   static const String signUp = '/signup';
//   static const String logIn = '/login';
//   static const String home = '/home';
//   static const String products = '/products';
//   static const String favorite = '/favorite';
//   static const String popularProducts = '/popular_products';
//   static const String specialOffers = '/special_offers';
//   static const String rentalAgreement = '/rental_agreement';
//   static const String details = '/details';
//   static const String sidebar = '/sidebar';
//   static const String contract = '/contract';
//   static const String cart = '/cart';

//   static final List<GetPage> getPages = [
//     GetPage(name: onboarding, page: () => const OnboardingScreen()),
//     GetPage(name: InitScreen.routeName, page: () => const InitScreen()),
//     GetPage(name: signUp, page: () => const signup()),
//     GetPage(name: logIn, page: () => const LOGIN()),
//     GetPage(name: home, page: () => const HomeScreen()),
//     GetPage(name: products, page: () => const ProductsScreen()),
//     GetPage(name: favorite, page: () => const FavoriteScreen()),
//     GetPage(name: popularProducts, page: () => const PopularProducts()),
//     GetPage(name: specialOffers, page: () => const SpecialOffers()),
//     GetPage(
//       name: rentalAgreement,
//       page: () => const RentalAgreementScreen(deviceName: '', rentAmount: 0),
//     ),
//     GetPage(
//       name: details,
//       page: () => DetailsScreen(args: Get.arguments),
//     ),
//     GetPage(name: sidebar, page: () => const Sidebar()),
//     GetPage(name: contract, page: () => const ContractPage()),
//     GetPage(name: cart, page: () => const CartScreen()),
//   ];
// }



// import 'package:flutter/material.dart';
// import 'package:localrepo/cart/cart_screen.dart';
// import 'package:localrepo/contract_page/contract_page.dart';
// import 'package:localrepo/details/details_screen.dart';
// import 'package:localrepo/favorite/favorite_screen.dart';
// import 'package:localrepo/homescreens/home_screen.dart';
// import 'package:localrepo/homescreens/popular_product.dart';
// import 'package:localrepo/homescreens/special_offers.dart';
// import 'package:localrepo/init_screen.dart';
// import 'package:localrepo/login%20screens/login.dart';

// import 'package:localrepo/onboarding_content/onboarding/screens/onboarding.dart';
// import 'package:localrepo/login%20screens/signUP.dart';
// import 'package:localrepo/products/products_screen.dart';
// import 'package:localrepo/rental_agreement/agreement_screen.dart';
// import 'package:localrepo/sidebar/sidebar_screen.dart';

// class AppRoutes {
//   static const String onboarding = '/onboarding';
//   static String routeName = "/"; // init screen
//   static const String signUp = '/signup';
//   static const String logIn = '/login';
//   static const String home = '/home';
//   static const String products = "/products";
//   static const String profile = '/profile'; // Add profile route
//   static const String favorite = '/favorite'; // Add favorite route
//   static const String popularProducts =
//       '/popular_products'; // Add popular products route
//   static const String specialOffers =
//       '/special_offers'; // Add special offers route
//   static const String rentalAgreement =
//       '/rental_agreement'; // Add rental agreement route
//   static const String details = '/details';
//   static const String sidebar = '/sidebar';
//   static const String contract = '/contract';
//   static const String cart = '/cart';

//   static final Map<String, WidgetBuilder> appRoutes = {
//     InitScreen.routeName: (context) => const InitScreen(),
//     onboarding: (context) => const OnboardingScreen(),
//     signUp: (context) => const signup(),
//     logIn: (context) => const LOGIN(),
//     home: (context) => const HomeScreen(),
//     products: (context) => const ProductsScreen(),
//     favorite: (context) => const FavoriteScreen(),
//     popularProducts: (context) => const PopularProducts(),
//     specialOffers: (context) => const SpecialOffers(),
//     rentalAgreement: (context) =>
//         const RentalAgreementScreen(deviceName: '', rentAmount: 0),
//     details: (context) {
//       final args =
//           ModalRoute.of(context)!.settings.arguments as ProductDetailsArguments;
//       return DetailsScreen(args: args);
//     },
//     sidebar: (context) => const Sidebar(),
//     contract: (context) => const ContractPage(),
//     cart: (context) => const CartScreen(),
//   };
// }
