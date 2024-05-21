import 'package:flutter/material.dart';

class InstallmentScreen extends StatefulWidget {
  @override
  _InstallmentScreenState createState() => _InstallmentScreenState();
}

class _InstallmentScreenState extends State<InstallmentScreen> {
  List<Map<String, dynamic>> installmentPlans = [
    {'months': 3, 'rate': 5.0, 'selected': false},
    {'months': 6, 'rate': 4.5, 'selected': false},
    {'months': 12, 'rate': 4.0, 'selected': false},
    {'months': 24, 'rate': 3.5, 'selected': false},
  ];
  Map<String, dynamic>? selectedPlan;

  void _selectPlan(int index) {
    setState(() {
      for (var plan in installmentPlans) {
        plan['selected'] = false;
      }
      installmentPlans[index]['selected'] = true;
      selectedPlan = installmentPlans[index];
    });
  }

  void _proceedWithPlan() {
    if (selectedPlan != null) {
      // Navigate to the next screen or perform further actions
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Proceeding with ${selectedPlan!['months']} months plan at ${selectedPlan!['rate']}% rate.')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please select an installment plan.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Installment Plans'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Choose an Installment Plan',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: installmentPlans.length,
                itemBuilder: (context, index) {
                  var plan = installmentPlans[index];
                  return GestureDetector(
                    onTap: () => _selectPlan(index),
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 8.0),
                      padding: EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: plan['selected'] ? Colors.blue[100] : Colors.white,
                        border: Border.all(
                          color: plan['selected'] ? Colors.blue : Colors.grey,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 5.0,
                            spreadRadius: 2.0,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${plan['months']} months',
                            style: TextStyle(fontSize: 18.0),
                          ),
                          Text(
                            '${plan['rate']}%',
                            style: TextStyle(fontSize: 18.0),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _proceedWithPlan,
              child: Text(
                'Proceed',
                style: TextStyle(fontSize: 18.0),
              ),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16.0), backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
