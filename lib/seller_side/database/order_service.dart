import 'package:localrepo/seller_side/database/dbhelper_orders.dart';
import 'package:localrepo/seller_side/models/order.dart';

class OrderService {
  final DatabaseHelper _dbHelper = DatabaseHelper();

  Future<List<Order>> fetchOrders() async {
    return await _dbHelper.fetchOrders();
  }

  Future<List<Order>> fetchRentedOrders() async {
    final List<Order> orders = await _dbHelper.fetchOrders();
    return orders.where((order) => order.type == 'rented').toList();
  }

  Future<List<Order>> fetchBoughtOrders() async {
    final List<Order> orders = await _dbHelper.fetchOrders();
    return orders.where((order) => order.type == 'bought').toList();
  }

  Future<int> addOrder(Order order) async {
    return await _dbHelper.insertOrder(order);
  }

  Future<int> updateOrder(Order order) async {
    return await _dbHelper.updateOrder(order);
  }

  Future<int> deleteOrder(int id) async {
    return await _dbHelper.deleteOrder(id);
  }
}
