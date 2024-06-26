import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:localrepo/seller_side/screens/analytics/livedata.dart';
import 'package:localrepo/seller_side/widgets/appbar.dart';
import 'dart:async';


class AdvancedAnalyticsScreen extends StatefulWidget {
  final Map<String, dynamic> liveData;
  final Map<String, Map<String, dynamic>> salesData;

  AdvancedAnalyticsScreen({required this.liveData, required this.salesData});

  @override
  _AdvancedAnalyticsScreenState createState() => _AdvancedAnalyticsScreenState();
}

class _AdvancedAnalyticsScreenState extends State<AdvancedAnalyticsScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);
    _animation = Tween<double>(begin: 1.0, end: 1.5).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Business Analytics',
        appBarHeight: 90.0, // Custom app bar height
        paddingTop: 15.0, // Padding from the top
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildLiveDataSection(),
            SizedBox(height: 20),
            DefaultTabController(
              length: 4,
              child: Column(
                children: [
                  TabBar(
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.grey,
                    indicatorColor: Colors.blue,
                    tabs: [
                      Tab(text: '1 Day'),
                      Tab(text: '7 Days'),
                      Tab(text: '15 Days'),
                      Tab(text: '30 Days'),
                    ],
                  ),
                  SizedBox(
                    height: 400, // Adjust height as needed
                    child: TabBarView(
                      children: [
                        _buildSalesData('1 Day'),
                        _buildSalesData('7 Days'),
                        _buildSalesData('15 Days'),
                        _buildSalesData('30 Days'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLiveDataSection() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color.fromARGB(255, 52, 165, 206), Color.fromARGB(255, 64, 153, 255)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ScaleTransition(
                scale: _animation,
                child: Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.redAccent,
                  ),
                ),
              ),
              SizedBox(width: 10),
              Text(
                'Live Data',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              Spacer(),
              IconButton(icon: Icon(Icons.arrow_forward_ios, color: Colors.white,),
              onPressed: () {
                Get.to(LiveDataDetailScreen());
              },),
            ],
          ),
          SizedBox(height: 10),
          Text(
            widget.liveData['buyers']?.toString() ?? '0',
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(height: 5),
          Text(
            'Buyers in the last 3 hours',
            style: TextStyle(fontSize: 16, color: Colors.white70),
          ),
        ],
      ),
    );
  }

  Widget _buildSalesData(String timeFrame) {
    Map<String, dynamic>? data = widget.salesData[timeFrame];
    if (data == null) {
      return Center(child: Text('No data available'));
    }
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Text(
            'Sales Data',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: _buildSalesMetric(Icons.attach_money, 'Revenue', data['revenue'])),
              SizedBox(width: 10),
              Expanded(child: _buildSalesMetric(Icons.shopping_cart, 'Orders', data['orders'])),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: _buildSalesMetric(Icons.show_chart, 'Units Sold', data['units_sold'])),
              SizedBox(width: 10),
              Expanded(child: _buildSalesMetric(Icons.monetization_on, 'Avg Order Value', data['avg_order_value'])),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSalesMetric(IconData icon, String label, dynamic value) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.0),
      margin: EdgeInsets.symmetric(vertical: 10.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [Colors.blue.shade100, Colors.blue.shade400],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Icon(
              icon,
              size: 40,
              color: Colors.blue.shade700,
            ),
          ),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade800,
                ),
              ),
              SizedBox(height: 5),
              Text(
                value.toString(),
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.blue.shade700,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}



class DataProvider {
  static Map<String, dynamic> fetchLiveData() {
    return {
      'buyers': 20, // Example value
    };
  }

  static Map<String, Map<String, dynamic>> fetchSalesData() {
    return {
      '1 Day': {
        'revenue': '10%',
        'orders': '20%',
        'units_sold': '30%',
        'avg_order_value': '40%',
      },
      '7 Days': {
        'revenue': '15%',
        'orders': '25%',
        'units_sold': '35%',
        'avg_order_value': '45%',
      },
      '15 Days': {
        'revenue': '20%',
        'orders': '30%',
        'units_sold': '40%',
        'avg_order_value': '50%',
      },
      '30 Days': {
        'revenue': '25%',
        'orders': '35%',
        'units_sold': '45%',
        'avg_order_value': '55%',
      },
    };
  }
}
