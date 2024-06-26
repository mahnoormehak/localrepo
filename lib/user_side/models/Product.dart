class Product {
  final int id;
  final String title, description, sellerName;
  final List<String> images;
  final double rating, price;
  final bool isFavourite, isPopular;

  Product({
    required this.id,
    required this.images,
    this.rating = 0.0,
    this.isFavourite = false,
    this.isPopular = false,
    required this.title,
    required this.price,
    required this.description,
    required this.sellerName,
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
    title: "Alpha 9 III - Full-frame Mirrorless",
    price: 25.99,
    description: description,
    rating: 4.8,
    isFavourite: true,
    isPopular: true,
    sellerName: "Emily Parker",
  ),
  Product(
    id: 2,
    images: [
      "assets/images/dji_mavic_1.png",
      "assets/images/dji_mavic_2.png",
      "assets/images/dji_mavic_3.png",
      "assets/images/dji_mavic_4.png",
    ],
    title: "DJI Mavic 3 Pro (DJI RC)",
    price: 17.9,
    description: description,
    rating: 4.1,
    isPopular: true,
    sellerName: "Liam Thompson",
  ),
  Product(
    id: 3,
    images: [
      "assets/images/dji_ronin_1.png",
      "assets/images/dji_ronin_2.png",
      "assets/images/dji_ronin_3.png",
      "assets/images/dji_ronin_4.png",
    ],
    title: "DJI Ronin 4D-8K",
    price: 150,
    description: description,
    rating: 4.1,
    isFavourite: true,
    isPopular: true,
    sellerName: "Olivia Martinez",
  ),
  Product(
    id: 4,
    images: [
      "assets/images/dji_gimble_1.png",
      "assets/images/dji_gimble_2.png",
      "assets/images/dji_gimble_3.png",
      "assets/images/dji_gimble_4.png",
    ],
    title: "DJI RS 3 Mini",
    price: 8.99,
    description: description,
    rating: 4.1,
    isFavourite: true,
    sellerName: "Noah Robinson",
  ),
  Product(
    id: 5,
    images: [
      "assets/images/osmo_pocket_1.png",
      "assets/images/osmo_pocket_2.png",
      "assets/images/osmo_pocket_3.png",
    ],
    title: "DJI Osmo Pocket 3",
    price: 17.9,
    description: description,
    rating: 4.1,
    isPopular: true,
    sellerName: "Ava Turner",
  ),
  Product(
    id: 6,
    images: [
      "assets/images/canon_1.png",
      "assets/images/canon_2.png",
      "assets/images/canon_3.png",
    ],
    title: "EOS 5D mark",
    price: 150,
    description: description,
    rating: 4.1,
    isFavourite: true,
    isPopular: true,
    sellerName: "Ethan Wright",
  ),
  Product(
    id: 7,
    images: [
      "assets/images/avatar_1.png",
      "assets/images/avatar_3.png",
    ],
    title: "DJI Avatar 2",
    price: 50.56,
    description: description,
    rating: 4.1,
    isFavourite: true,
    sellerName: "Sophia Hill",
  ),
  // Duplicate the products to make a total of 14
  Product(
    id: 8,
    images: [
      "assets/images/sony_alpha9_1.png",
      "assets/images/sony_alpha9_2.png",
      "assets/images/sony_alpha9_3.png",
      "assets/images/sony_alpha9_4.png",
    ],
    title: "Alpha 9 III - Full-frame Mirrorless",
    price: 25.99,
    description: description,
    rating: 4.8,
    isFavourite: true,
    isPopular: true,
    sellerName: "Emily Parker",
  ),
  Product(
    id: 9,
    images: [
      "assets/images/dji_mavic_1.png",
      "assets/images/dji_mavic_2.png",
      "assets/images/dji_mavic_3.png",
      "assets/images/dji_mavic_4.png",
    ],
    title: "DJI Mavic 3 Pro (DJI RC)",
    price: 17.9,
    description: description,
    rating: 4.1,
    isPopular: true,
    sellerName: "Liam Thompson",
  ),
  Product(
    id: 10,
    images: [
      "assets/images/dji_ronin_1.png",
      "assets/images/dji_ronin_2.png",
      "assets/images/dji_ronin_3.png",
      "assets/images/dji_ronin_4.png",
    ],
    title: "DJI Ronin 4D-8K",
    price: 150,
    description: description,
    rating: 4.1,
    isFavourite: true,
    isPopular: true,
    sellerName: "Olivia Martinez",
  ),
  Product(
    id: 11,
    images: [
      "assets/images/dji_gimble_1.png",
      "assets/images/dji_gimble_2.png",
      "assets/images/dji_gimble_3.png",
      "assets/images/dji_gimble_4.png",
    ],
    title: "DJI RS 3 Mini",
    price: 8.99,
    description: description,
    rating: 4.1,
    isFavourite: true,
    sellerName: "Noah Robinson",
  ),
  Product(
    id: 12,
    images: [
      "assets/images/osmo_pocket_1.png",
      "assets/images/osmo_pocket_2.png",
      "assets/images/osmo_pocket_3.png",
    ],
    title: "DJI Osmo Pocket 3",
    price: 17.9,
    description: description,
    rating: 4.1,
    isPopular: true,
    sellerName: "Ava Turner",
  ),
  Product(
    id: 13,
    images: [
      "assets/images/canon_1.png",
      "assets/images/canon_2.png",
      "assets/images/canon_3.png",
    ],
    title: "EOS 5D mark",
    price: 150,
    description: description,
    rating: 4.1,
    isFavourite: true,
    isPopular: true,
    sellerName: "Ethan Wright",
  ),
  Product(
    id: 14,
    images: [
      "assets/images/avatar_1.png",
      "assets/images/avatar_3.png",
    ],
    title: "DJI Avatar 2",
    price: 50.56,
    description: description,
    rating: 4.1,
    isFavourite: true,
    sellerName: "Sophia Hill",
  ),
];

const String description =
    "The camera features include blackout-free shooting, continuous shooting at 120 fps with full AF/AE tracking, and a maximum shutter speed of 1/80,000 second, each represented by a labeled bar extending horizontally from the baseline on the graph. …";

// class Product {
//   final int id;
//   final String title, description, sellerName;
//   final List<String> images;
//   final double rating, price;
//   final bool isFavourite, isPopular;

//   Product({
//     required this.id,
//     required this.images,
//     this.rating = 0.0,
//     this.isFavourite = false,
//     this.isPopular = false,
//     required this.title,
//     required this.price,
//     required this.description,
//     required this.sellerName,
//   });
// }

// // Our demo Products

// List<Product> demoProducts = [
//   Product(
//     id: 1,
//     images: [
//       "assets/images/sony_alpha9_1.png",
//       "assets/images/sony_alpha9_2.png",
//       "assets/images/sony_alpha9_3.png",
//       "assets/images/sony_alpha9_4.png",
//     ],
//     title: "Alpha 9 III - Full-frame Mirrorless",
//     price: 25.99,
//     description: description,
//     rating: 4.8,
//     isFavourite: true,
//     isPopular: true,
//     sellerName: "Seller A",
//   ),
//   Product(
//     id: 2,
//     images: [
//       "assets/images/dji_mavic_1.png",
//       "assets/images/dji_mavic_2.png",
//       "assets/images/dji_mavic_3.png",
//       "assets/images/dji_mavic_4.png",
//     ],
//     title: "DJI Mavic 3 Pro (DJI RC)",
//     price: 17.9,
//     description: description,
//     rating: 4.1,
//     isPopular: true,
//     sellerName: "Seller B",
//   ),
//   Product(
//     id: 3,
//     images: [
//       "assets/images/dji_ronin_1.png",
//       "assets/images/dji_ronin_2.png",
//       "assets/images/dji_ronin_3.png",
//       "assets/images/dji_ronin_4.png",
//     ],
//     title: "DJI Ronin 4D-8K",
//     price: 150,
//     description: description,
//     rating: 4.1,
//     isFavourite: true,
//     isPopular: true,
//     sellerName: "Seller C",
//   ),
//   Product(
//     id: 4,
//     images: [
//       "assets/images/dji_gimble_1.png",
//       "assets/images/dji_gimble_2.png",
//       "assets/images/dji_gimble_3.png",
//       "assets/images/dji_gimble_4.png",
//     ],
//     title: "DJI RS 3 Mini",
//     price: 8.99,
//     description: description,
//     rating: 4.1,
//     isFavourite: true,
//     sellerName: "Seller D",
//   ),
//   // More products...
// ];

// const String description =
//     "The camera features include blackout-free shooting, continuous shooting at 120 fps with full AF/AE tracking, and a maximum shutter speed of 1/80,000 second, each represented by a labeled bar extending horizontally from the baseline on the graph. …";


// class Product {
//   final int id;
//   final String title, description;
//   final List<String> images;
//   final double rating, price;
//   final bool isFavourite, isPopular;

//   Product({
//     required this.id,
//     required this.images,
//     this.rating = 0.0,
//     this.isFavourite = false,
//     this.isPopular = false,
//     required this.title,
//     required this.price,
//     required this.description,
//   });
// }

// // Our demo Products

// List<Product> demoProducts = [
//   Product(
//     id: 1,
//     images: [
//       "assets/images/sony_alpha9_1.png",
//       "assets/images/sony_alpha9_2.png",
//       "assets/images/sony_alpha9_3.png",
//       "assets/images/sony_alpha9_4.png",
//     ],
//     title: "Alpha 9 III - Full-frame Mirrorless",
//     price: 25.99,
//     description: description,
//     rating: 4.8,
//     isFavourite: true,
//     isPopular: true,
//   ),
//   Product(
//     id: 2,
//     images: [
//       "assets/images/dji_mavic_1.png",
//       "assets/images/dji_mavic_2.png",
//       "assets/images/dji_mavic_3.png",
//       "assets/images/dji_mavic_4.png",
//     ],
//     title: "DJI Mavic 3 Pro (DJI RC)",
//     price: 17.9,
//     description: description,
//     rating: 4.1,
//     isPopular: true,
//   ),
//   Product(
//     id: 3,
//     images: [
//       "assets/images/dji_ronin_1.png",
//       "assets/images/dji_ronin_2.png",
//       "assets/images/dji_ronin_3.png",
//       "assets/images/dji_ronin_4.png",
//     ],
//     title: "DJI Ronin 4D-8K",
//     price: 150,
//     description: description,
//     rating: 4.1,
//     isFavourite: true,
//     isPopular: true,
//   ),
//   Product(
//     id: 4,
//     images: [
//       "assets/images/dji_gimble_1.png",
//       "assets/images/dji_gimble_2.png",
//       "assets/images/dji_gimble_3.png",
//       "assets/images/dji_gimble_4.png",
//     ],
//     title: "DJI RS 3 Mini",
//     price: 8.99,
//     description: description,
//     rating: 4.1,
//     isFavourite: true,
//   ),
//   Product(
//     id: 1,
//     images: [
//       "assets/images/sony_alpha9_1.png",
//       "assets/images/sony_alpha9_2.png",
//       "assets/images/sony_alpha9_3.png",
//       "assets/images/sony_alpha9_4.png",
//     ],
//     title: "Alpha 9 III - Full-frame Mirrorless",
//     price: 25.99,
//     description: description,
//     rating: 4.8,
//     isFavourite: true,
//     isPopular: true,
//   ),
//   Product(
//     id: 2,
//     images: [
//       "assets/images/dji_mavic_1.png",
//       "assets/images/dji_mavic_2.png",
//       "assets/images/dji_mavic_3.png",
//       "assets/images/dji_mavic_4.png",
//     ],
//     title: "DJI Mavic 3 Pro (DJI RC)",
//     price: 17.9,
//     description: description,
//     rating: 4.1,
//     isPopular: true,
//   ),
//   Product(
//     id: 3,
//     images: [
//       "assets/images/dji_ronin_1.png",
//       "assets/images/dji_ronin_2.png",
//       "assets/images/dji_ronin_3.png",
//       "assets/images/dji_ronin_4.png",
//     ],
//     title: "DJI Ronin 4D-8K",
//     price: 150,
//     description: description,
//     rating: 4.1,
//     isFavourite: true,
//     isPopular: true,
//   ),
//   Product(
//     id: 4,
//     images: [
//       "assets/images/dji_gimble_1.png",
//       "assets/images/dji_gimble_2.png",
//       "assets/images/dji_gimble_3.png",
//       "assets/images/dji_gimble_4.png",
//     ],
//     title: "DJI RS 3 Mini",
//     price: 8.99,
//     description: description,
//     rating: 4.1,
//     isFavourite: true,
//   ),
// ];

// const String description =
//     "The camera features include blackout-free shooting, continuous shooting at 120 fps with full AF/AE tracking, and a maximum shutter speed of 1/80,000 second, each represented by a labeled bar extending horizontally from the baseline on the graph. …";
