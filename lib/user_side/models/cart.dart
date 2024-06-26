
import 'package:localrepo/user_side/models/Product.dart';

class Cart {
  final Product product;
  final int numOfItem;

  Cart({required this.product, required this.numOfItem});
}

// Empty list initially
List<Cart> demoCarts = [];
