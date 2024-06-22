import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Import Get package
import 'package:localrepo/seller_side/screens/inventory/orders/ordrdetails.dart';
import 'package:localrepo/seller_side/utils/colors.dart';
import 'package:localrepo/seller_side/widgets/appbar.dart';
import '../../../models/order.dart';
import '../../../database/order_service.dart';

class OrdersScreen extends StatefulWidget {
  @override
  _OrdersScreenState createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> with SingleTickerProviderStateMixin {
  TabController? _tabController;
  late Future<List<Order>> _rentedOrdersFuture;
  late Future<List<Order>> _boughtOrdersFuture;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _rentedOrdersFuture = OrderService().fetchRentedOrders();
    _boughtOrdersFuture = OrderService().fetchBoughtOrders();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar2(
        title: "Manage Orders",
        appBarHeight: 90.0,
        paddingTop: 15.0,
      ),
      body: Column(
        children: <Widget>[
          SizedBox(height: 20.0),
          TabBar(
            controller: _tabController,
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(width: 4.0, color: AppColors.btncolor),
              insets: EdgeInsets.symmetric(horizontal: 16.0),
            ),
            labelColor: AppColors.btncolor,
            unselectedLabelColor: Color(0xFFCDCDCD),
            tabs: [
              Tab(
                child: Text(
                  'Rented Items',
                  style: TextStyle(
                    fontFamily: 'Varela',
                    fontSize: 21.0,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  'Bought Items',
                  style: TextStyle(
                    fontFamily: 'Varela',
                    fontSize: 21.0,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 25,),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildOrderList(_rentedOrdersFuture),
                _buildOrderList(_boughtOrdersFuture),
              ],
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildOrderList(Future<List<Order>> ordersFuture) {
    return FutureBuilder<List<Order>>(
      future: ordersFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No orders found.'));
        } else {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final order = snapshot.data![index];
              return Card(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: order.imageUrl != null
                            ? Image.network(
                                order.imageUrl!,
                                width: 80,
                                height: 80,
                                fit: BoxFit.cover,
                              )
                            : Container(
                                width: 80,
                                height: 80,
                                color: Colors.grey[200],
                                child: Icon(
                                  Icons.image,
                                  size: 40,
                                  color: Colors.grey[400],
                                ),
                              ),
                      ),
                      SizedBox(width: 16.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              order.product,
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              'Customer: ${order.customerName}',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              'Status: ${order.status}',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: order.status == 'Delivered'
                                    ? Colors.green
                                    : Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.arrow_forward_ios),
                        onPressed: () {
                          Get.to(OrderDetailScreen(order: order));
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }
      },
    );
  }
}
