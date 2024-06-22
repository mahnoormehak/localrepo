import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:localrepo/seller_side/screens/inventory/add_products/imageselector.dart';
import 'package:localrepo/seller_side/screens/inventory/all_products/all_products.dart';
import 'package:localrepo/seller_side/screens/inventory/finance/finance.dart';
import 'package:localrepo/seller_side/screens/inventory/orders/order_screen.dart';
import 'package:localrepo/seller_side/widgets/appbar.dart';
import 'package:localrepo/seller_side/widgets/sectionitem.dart';

class ManagementScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: '  management',
        appBarHeight: 90.0, // Custom app bar height
        paddingTop: 15.0, // Padding from the top
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 30.0,
          mainAxisSpacing: 30.0,
          children: [
            SectionItem(
              title: 'Add Products',
              icon: Icons.add_box,
              onTap: () {
                // Navigate to Add Products screen
                  Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ImageSelectorPage()
                    ),
                  
                );
              },
            ),
            SectionItem(
              title: 'Products',
              icon: Icons.inventory,
              onTap: () {
                // Navigate to Products screen
                     Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>CombinedScreen()
                    ),
                  
                );
              },
            ),
            SectionItem(
              title: 'Orders',
              icon: Icons.shopping_cart,
              onTap: () {
                // Navigate to Orders screen
                   Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>OrdersScreen()
                    ),
                   );
              },
            ),
            SectionItem(
              title: 'Finance',
              icon: Icons.attach_money,
              onTap: () {
                // Navigate to Finance screen
                 Get.to(FinanceScreen());
              },
            ),
          ],
        ),
      ),
    );
  }
}