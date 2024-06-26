class Order {
  final int? id;
  final String product;
  final String customerName;
  final String status;
  final int quantity;
  final double price;
  final String type; // "rented" or "bought"
  final String? imageUrl; // URL of the product image

  Order({
    this.id,
    required this.product,
    required this.customerName,
    required this.status,
    required this.quantity,
    required this.price,
    required this.type,
    this.imageUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'product': product,
      'customerName': customerName,
      'status': status,
      'quantity': quantity,
      'price': price,
      'type': type,
      'imageUrl': imageUrl,
    };
  }

  factory Order.fromMap(Map<String, dynamic> map) {
    return Order(
      id: map['id'],
      product: map['product'],
      customerName: map['customerName'],
      status: map['status'],
      quantity: map['quantity'],
      price: map['price'],
      type: map['type'],
      imageUrl: map['imageUrl'],
    );
  }
}
