import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:localrepo/seller_side/screens/inventory/add_products/imageselector.dart';
import 'package:localrepo/seller_side/screens/inventory/all_products/all_products.dart';
import 'package:localrepo/seller_side/screens/inventory/finance/finance.dart';
import 'package:localrepo/seller_side/screens/inventory/orders/order_screen.dart';
import 'package:localrepo/seller_side/widgets/appbar.dart';
import 'package:localrepo/seller_side/widgets/sectionitem.dart';
import 'package:localrepo/user_side/Database/uploadScreen/SELL/image.dart.dart';
import 'package:localrepo/user_side/Database/uploadScreen/image.dart';

class ManagementScreen extends StatefulWidget {
  @override
  State<ManagementScreen> createState() => _ManagementScreenState();
}

class _ManagementScreenState extends State<ManagementScreen> {
  

   void _showSellerOptions() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          title: const Text(
            "Become a Seller",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: const Text(
            "Would you like to rent or sell items?",
            style: TextStyle(fontSize: 16),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(
                "Rent",
                style: TextStyle(fontSize: 16, color: Colors.blue),
              ),
              onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>ImageSelectorPage()));
                // Navigate to rent items screen
               // Navigator.pushNamed(context, AppRoutes.rentItems);
              },
            ),
            TextButton(
              child: const Text(
                "Sell",
                style: TextStyle(fontSize: 16, color: Colors.blue),
              ),
              onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>ImageSelectorPage1()));
                // Navigate to sell items screen
             //   Navigator.pushNamed(context, AppRoutes.sellItems);
              },
            ),
          ],
        );
      },
    );
  }
  
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
                _showSellerOptions();
               // Navigate to Add Products screen
                  // Navigator.push(
                  // context,
                  // MaterialPageRoute(
                  //   builder: (context) => ImageSelectorPage()
                  //   ),
                  
              //  );
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
                    builder: (context) =>CartScreen()
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
