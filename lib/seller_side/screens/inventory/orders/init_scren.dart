import 'package:flutter/material.dart';
import 'package:localrepo/seller_side/database/order_service.dart';
import 'package:localrepo/seller_side/models/order.dart';
import 'package:localrepo/seller_side/widgets/navbar.dart';

class InitializationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: _initializeApp(context),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        } else if (snapshot.hasError) {
          
          return Scaffold(
            body: Center(child: Text('Initialization failed: ${snapshot.error}')),
          );
        } else {
          return Container(); // This won't be shown as we're navigating to the HomeScreen
        }
      },
    );
  }

  Future<void> _initializeApp(BuildContext context) async {
    final orderService = OrderService();

    // Check if there is existing data
    final orders = await orderService.fetchOrders();
    if (orders.isEmpty) {
      // Insert sample data if no existing data
      await orderService.addOrder(Order(
        id: null,
        customerName: 'John Doe',
        product: 'Product A',
        quantity: 2,
        price: 50.0,
        status: 'Shipped',
        type: 'rented',
        imageUrl: 'https://www.premiumbeat.com/blog/wp-content/uploads/2020/07/Camera-Tech-Cover-photo.jpg?w=875&h=490&crop=1',
    
      ));
      await orderService.addOrder(Order(
        id: null,
        customerName: 'Jane Smith',
        product: 'Product B',
        quantity: 1,
        price: 30.0,
        status: 'Processing',
        type: 'bought',
        imageUrl: 'https://www.premiumbeat.com/blog/wp-content/uploads/2020/07/Camera-Tech-Cover-photo.jpg?w=875&h=490&crop=1',
      ));
    }

    // Navigate to the main screen (home screen) after initialization
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => NavBarScreen()),
    );
  }
}
