import 'package:flutter/material.dart';

class Product {
  final int id;
  final String title, description;
  final List<String> images;
  final List<Color> colors;
  final double rating, price;
  final bool isFavourite, isPopular;

  Product({
    required this.id,
    required this.images,
    required this.colors,
    this.rating = 0.0,
    this.isFavourite = false,
    this.isPopular = false,
    required this.title,
    required this.price,
    required this.description,
  });
}

// Our demo Products

List<Product> demoProducts = [
  Product(
    id: 1,
    images: [
      "assets/images/sony_alpha9_1.png",
      "assets/images/sony_alpha9_2.png",
      "assets/images/sony_alpha9_3.png",
      "assets/images/sony_alpha9_4.png",
    ],
    colors: [
      const Color(0xFFF6625E),
      const Color(0xFF836DB8),
      const Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Alpha 9 III - Full-frame Mirrorless",
    price: 25.99,
    description: description,
    rating: 4.8,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 2,
    images: [
      "assets/images/dji_mavic_1.png",
      "assets/images/dji_mavic_2.png",
      "assets/images/dji_mavic_3.png",
      "assets/images/dji_mavic_4.png",
    ],
    colors: [
      const Color(0xFFF6625E),
      const Color(0xFF836DB8),
      const Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "DJI Mavic 3 Pro (DJI RC)",
    price: 17.9,
    description: description,
    rating: 4.1,
    isPopular: true,
  ),
  Product(
    id: 3,
    images: [
      "assets/images/dji_ronin_1.png",
      "assets/images/dji_ronin_2.png",
      "assets/images/dji_ronin_3.png",
      "assets/images/dji_ronin_4.png",
    ],
    colors: [
      const Color(0xFFF6625E),
      const Color(0xFF836DB8),
      const Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "DJI Ronin 4D-8K",
    price: 150,
    description: description,
    rating: 4.1,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 4,
    images: [
      "assets/images/dji_gimble_1.png",
      "assets/images/dji_gimble_2.png",
      "assets/images/dji_gimble_3.png",
      "assets/images/dji_gimble_4.png",
    ],
    colors: [
      const Color(0xFFF6625E),
      const Color(0xFF836DB8),
      const Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "DJI RS 3 Mini",
    price: 8.99,
    description: description,
    rating: 4.1,
    isFavourite: true,
  ),
  Product(
    id: 1,
    images: [
      "assets/images/sony_alpha9_1.png",
      "assets/images/sony_alpha9_2.png",
      "assets/images/sony_alpha9_3.png",
      "assets/images/sony_alpha9_4.png",
    ],
    colors: [
      const Color(0xFFF6625E),
      const Color(0xFF836DB8),
      const Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Alpha 9 III - Full-frame Mirrorless",
    price: 25.99,
    description: description,
    rating: 4.8,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 2,
    images: [
      "assets/images/dji_mavic_1.png",
      "assets/images/dji_mavic_2.png",
      "assets/images/dji_mavic_3.png",
      "assets/images/dji_mavic_4.png",
    ],
    colors: [
      const Color(0xFFF6625E),
      const Color(0xFF836DB8),
      const Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "DJI Mavic 3 Pro (DJI RC)",
    price: 17.9,
    description: description,
    rating: 4.1,
    isPopular: true,
  ),
  Product(
    id: 3,
    images: [
      "assets/images/dji_ronin_1.png",
      "assets/images/dji_ronin_2.png",
      "assets/images/dji_ronin_3.png",
      "assets/images/dji_ronin_4.png",
    ],
    colors: [
      const Color(0xFFF6625E),
      const Color(0xFF836DB8),
      const Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "DJI Ronin 4D-8K",
    price: 150,
    description: description,
    rating: 4.1,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 4,
    images: [
      "assets/images/dji_gimble_1.png",
      "assets/images/dji_gimble_2.png",
      "assets/images/dji_gimble_3.png",
      "assets/images/dji_gimble_4.png",
    ],
    colors: [
      const Color(0xFFF6625E),
      const Color(0xFF836DB8),
      const Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "DJI RS 3 Mini",
    price: 8.99,
    description: description,
    rating: 4.1,
    isFavourite: true,
  ),
];

const String description =
    "The camera features include blackout-free shooting, continuous shooting at 120 fps with full AF/AE tracking, and a maximum shutter speed of 1/80,000 second, each represented by a labeled bar extending horizontally from the baseline on the graph. …";
