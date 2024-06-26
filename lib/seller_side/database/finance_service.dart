import 'dart:async';

import 'package:localrepo/seller_side/models/transaction.dart';
class FinanceService {
  Future<double> fetchCurrentBalance() async {
    await Future.delayed(Duration(seconds: 2)); // Simulate network delay
    return 5000.0; // Example current balance
  }

  Future<List<Transaction>> fetchPendingTransactions() async {
    await Future.delayed(Duration(seconds: 2)); // Simulate network delay
    return [
      Transaction(name: 'Supplier A', amount: 500.0),
      Transaction(name: 'Supplier B', amount: 600.0),
      Transaction(name: 'Supplier C', amount: 400.0),
    ];
  }

  Future<List<Transaction>> fetchPaidTransactions() async {
    await Future.delayed(Duration(seconds: 2)); // Simulate network delay
    return [
      Transaction(name: 'Supplier D', amount: 1750.0),
      Transaction(name: 'Supplier E', amount: 1750.0),
    ];
  }
}
