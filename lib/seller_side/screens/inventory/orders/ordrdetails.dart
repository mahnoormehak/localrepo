import 'package:flutter/material.dart';
import 'package:localrepo/seller_side/models/order.dart';
import 'package:localrepo/seller_side/widgets/appbar.dart';

class OrderDetailScreen extends StatelessWidget {
  final Order order;

  const OrderDetailScreen({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar2(
        title: "Order Details",
        appBarHeight: 90.0,
        paddingTop: 10.0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30.0,),
            Center(
              child: order.imageUrl != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        order.imageUrl!,
                        height: 200,
                        width: 200,
                        fit: BoxFit.cover,
                      ),
                    )
                  : Container(
                      height: 200,
                      width: 200,
                      color: Colors.grey[200],
                      child: Icon(
                        Icons.image,
                        size: 100,
                        color: Colors.grey[400],
                      ),
                    ),
            ),
            SizedBox(height: 60),
            Text(
              'Product: ${order.product}',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),
            Text(
              'Customer: ${order.customerName}',
              style: TextStyle(fontSize: 20, color: Colors.black87),
            ),
            SizedBox(height: 8),
           
            SizedBox(height: 24),
            Divider(thickness: 1.5),
            SizedBox(height: 16),
            Text(
              'Order Details:',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),
            _buildDetailRow('Quantity', '${order.quantity}'),
            SizedBox(height: 8),
            _buildDetailRow('Price', '\$${order.price.toStringAsFixed(2)}'),
            SizedBox(height: 8),
            _buildDetailRow('Type', '${order.type}'),
            SizedBox(height: 90,),
              Center(
                child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
                                decoration: BoxDecoration(
                                  color: order.status == 'Delivered' ? Colors.green[100] : Colors.red[100],
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      order.status == 'Delivered' ? Icons.check_circle : Icons.warning,
                                      color: order.status == 'Delivered' ? Colors.green : Colors.red,
                                    ),
                                    SizedBox(width: 8.0),
                                    Text(
                                      'Status: ${order.status}',
                                      style: TextStyle(
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.bold,
                                        color: order.status == 'Delivered' ? Colors.green : Colors.red,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
              ),
          ],
        ),
      ),
    );
  }

  //  Widget _buildDetailRow(String label, String value) {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(vertical: 4.0),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //       children: [
  //         Row(
  //           children: [
  //             Icon(
  //           _getIconForLabel(label),
  //           color: Colors.grey[700],
  //         ),
  //         SizedBox(width: 8.0),
  //         Text(
  //           '$label: ',
  //           style: TextStyle(
  //             fontSize: 18,
  //             fontWeight: FontWeight.bold,
  //           ),
  //         ),
  //         ],),
          
  //         Expanded(
  //           child: Text(
  //             value,
  //             style: TextStyle(fontSize: 18),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
  Widget _buildDetailRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 18, color: Colors.black54),
        ),
        Text(
          value,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
  IconData _getIconForLabel(String label) {
    switch (label) {
      case 'Quantity':
        return Icons.production_quantity_limits;
      case 'Price':
        return Icons.attach_money;
      case 'Type':
        return Icons.category;
      default:
        return Icons.info;
    }
  }

