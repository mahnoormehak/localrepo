import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../models/cart.dart';
import 'components/cart_card.dart';
import 'components/check_out_card.dart';

class CartScreen extends StatefulWidget {
  static String routeName = "/cart";

  const CartScreen({
    super.key,
  });

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  double calculateTotalPrice(List<Cart> carts) {
    double totalPrice = 0;
    for (var cart in carts) {
      totalPrice += cart.product.price * cart.numOfItem;
    }
    return totalPrice;
  }

  @override
  Widget build(BuildContext context) {
    // Calculate total price
    double totalPrice = calculateTotalPrice(demoCarts);

    // Remove duplicate items from the cart list
    final Set<int> productIds = {};
    final List<Cart> uniqueCarts = [];
    for (final cartItem in demoCarts) {
      if (productIds.contains(cartItem.product.id)) {
        continue;
      }
      productIds.add(cartItem.product.id);
      uniqueCarts.add(cartItem);
    }

    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            const Text(
              "Your Cart",
              style: TextStyle(color: Colors.black),
            ),
            Text(
              "${uniqueCarts.length} items",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView.builder(
          itemCount: uniqueCarts.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Dismissible(
              key: Key(uniqueCarts[index].product.id.toString()),
              direction: DismissDirection.endToStart,
              onDismissed: (direction) {
                setState(() {
                  demoCarts.remove(uniqueCarts[index]);
                });
              },
              background: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFE6E6),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    const Spacer(),
                    SvgPicture.asset("assets/icons/Trash.svg"),
                  ],
                ),
              ),
              child: CartCard(cart: uniqueCarts[index]),
            ),
          ),
        ),
      ),
      bottomNavigationBar: CheckoutCard(totalPrice: totalPrice),
    );
  }
}
