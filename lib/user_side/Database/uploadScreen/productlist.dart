import 'package:flutter/material.dart';
import 'package:localrepo/user_side/custom_widgets/button.dart';
class ProductListingPage extends StatefulWidget {
  @override
  _ProductListingPageState createState() => _ProductListingPageState();
}

class _ProductListingPageState extends State<ProductListingPage> {
  bool _isRenting = false;

  @override
  void initState() {
    super.initState();
    _showRentOrSellDialog();
  }

  void _showRentOrSellDialog() async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Choose Selling Option'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                title: const Text('Sell'),
                onTap: () {
                  setState(() {
                    _isRenting = false;
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Rent'),
                onTap: () {
                  setState(() {
                    _isRenting = true;
                  });
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade100,
        title: const Text(
          'List Your Product',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 16.0),
            SizedBox(height: 16.0),
            CustomButton(
              text: 'Submit',
              onPressed: () {
                // You can use _isRenting value here for further processing
                print('Is Renting: $_isRenting');
                // Navigate to another screen or show a confirmation message
              },
            ),
          ],
        ),
      ),
    );
  }
}
