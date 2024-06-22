import 'package:flutter/material.dart';

class LiveDataDetailScreen extends StatefulWidget {
  @override
  _LiveDataDetailScreenState createState() => _LiveDataDetailScreenState();
}

class _LiveDataDetailScreenState extends State<LiveDataDetailScreen> {
  String selectedCategory = 'Buyers';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Live Data'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildCategorySelector(),
            SizedBox(height: 20),
            _buildGraphSection(),
            SizedBox(height: 20),
            _buildDetailMetrics(),
          ],
        ),
      ),
    );
  }

  Widget _buildCategorySelector() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildCategoryButton('Buyers'),
        _buildCategoryButton('Renters'),
        _buildCategoryButton('Orders'),
        _buildCategoryButton('Revenue'),
      ],
    );
  }

  Widget _buildCategoryButton(String category) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCategory = category;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
          color: selectedCategory == category ? Colors.blue : Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.blue),
        ),
        child: Text(
          category,
          style: TextStyle(
            color: selectedCategory == category ? Colors.white : Colors.blue,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildGraphSection() {
    // Placeholder for the graph widget
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.blue),
      ),
      child: Center(
        child: Text(
          '$selectedCategory Graph',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildDetailMetrics() {
    List<Map<String, dynamic>> metrics = [
      {
        'icon': Icons.person,
        'label': 'Buyers',
        'value': '120',
      },
      {
        'icon': Icons.home,
        'label': 'Renters',
        'value': '50',
      },
      {
        'icon': Icons.shopping_cart,
        'label': 'Orders',
        'value': '300',
      },
      {
        'icon': Icons.attach_money,
        'label': 'Revenue',
        'value': '\$1200',
      },
    ];

    return Expanded(
      child: ListView.builder(
        itemCount: metrics.length,
        itemBuilder: (context, index) {
          var metric = metrics[index];
          return _buildMetricCard(metric['icon'], metric['label'], metric['value']);
        },
      ),
    );
  }

  Widget _buildMetricCard(IconData icon, String label, String value) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.blue.shade100,
          child: Icon(icon, color: Colors.blue),
        ),
        title: Text(
          label,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        trailing: Text(
          value,
          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
