// favorite_controller.dart
import 'package:get/get.dart';
import 'package:localrepo/models/Product.dart';

class FavoriteController extends GetxController {
  var favoriteProducts = <Product>[].obs;

  void toggleFavorite(Product product) {
    if (favoriteProducts.contains(product)) {
      favoriteProducts.remove(product);
    } else {
      favoriteProducts.add(product);
    }
  }

  bool isFavorite(Product product) {
    return favoriteProducts.contains(product);
  }
}
