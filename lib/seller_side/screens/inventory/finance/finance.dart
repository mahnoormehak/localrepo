import 'package:flutter/material.dart';
import 'package:localrepo/seller_side/database/finance_service.dart';
import 'package:localrepo/seller_side/models/transaction.dart';
import 'package:localrepo/seller_side/utils/colors.dart';
import 'package:localrepo/seller_side/widgets/appbar.dart';
class FinanceScreen extends StatefulWidget {
  @override
  _FinanceScreenState createState() => _FinanceScreenState();
}

class _FinanceScreenState extends State<FinanceScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final FinanceService _financeService = FinanceService();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar2(
        title: "Finance",
        appBarHeight: 90.0,
      //  paddingTop: 15.0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildCurrentBalanceCard(),
          SizedBox(height: 20),
          _buildTabBarSection(),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildPendingTransactions(),
                _buildPaidTransactions(),
              ],
            ),
          ),
        ],
      ),
    );
  }

 Widget _buildCurrentBalanceCard() {
  return FutureBuilder<double>(
    future: _financeService.fetchCurrentBalance(),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return Center(child: CircularProgressIndicator());
      } else if (snapshot.hasError) {
        return Center(child: Text('Error: ${snapshot.error}'));
      } else {
        return Container(
          padding: EdgeInsets.all(16.0),
          margin: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColors.btncolor, Colors.blueAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                spreadRadius: 2,
                offset: Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.account_balance_wallet,
                    color: Colors.white,
                    size: 30,
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Current Balance',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Center(
                child: Text(
                  '\$${snapshot.data!.toStringAsFixed(2)}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        );
      }
    },
  );
}


  Widget _buildTabBarSection() {
    return Container(
      color: Colors.grey[200],
      child: TabBar(
        controller: _tabController,
        indicatorColor: AppColors.btncolor,
        labelColor: AppColors.btncolor,
        unselectedLabelColor: Colors.grey,
        tabs: [
          Tab(text: 'Pending'),
          Tab(text: 'Paid'),
        ],
      ),
    );
  }

  Widget _buildPendingTransactions() {
    return FutureBuilder<List<Transaction>>(
      future: _financeService.fetchPendingTransactions(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No pending transactions.'));
        } else {
          return ListView.builder(
            padding: EdgeInsets.all(16.0),
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final transaction = snapshot.data![index];
              return _buildTransactionCard(transaction);
            },
          );
        }
      },
    );
  }

  Widget _buildPaidTransactions() {
    return FutureBuilder<List<Transaction>>(
      future: _financeService.fetchPaidTransactions(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No paid transactions.'));
        } else {
          return ListView.builder(
            padding: EdgeInsets.all(16.0),
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final transaction = snapshot.data![index];
              return _buildTransactionCard(transaction);
            },
          );
        }
      },
    );
  }

Widget _buildTransactionCard(Transaction transaction) {
  return Card(
    elevation: 4.0,
    margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.0),
    ),
    child: ListTile(
      contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
      leading: Icon(
        Icons.monetization_on,
        color: transaction.amount < 0 ? Colors.red : Colors.green,
        size: 30.0,
      ),
      title: Text(
        transaction.name,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.deepPurple,
        ),
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '\$${transaction.amount.toStringAsFixed(2)}',
            style: TextStyle(
              fontSize: 18,
              color: transaction.amount < 0 ? Colors.red : Colors.green,
              fontWeight: FontWeight.bold,
            ),
          ),
          // You can remove the text here
        ],
      ),
    ),
  );
}

}