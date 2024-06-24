import 'package:flutter/material.dart';

import 'package:localrepo/constants_copy.dart';
import 'package:localrepo/details/components/review_section.dart';

import '../../../models/Product.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({
    super.key,
    required this.product,
    this.pressOnSeeMore,
  });

  final Product product;
  final GestureTapCallback? pressOnSeeMore;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            product.title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 64,
          ),
          child: Text(
            product.description,
            maxLines: 3,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 12,
          ),
          child: GestureDetector(
            onTap: pressOnSeeMore,
            child: const Row(
              children: [
                Text(
                  "Reviews and Ratings",
                  style: TextStyle(
                      fontWeight: FontWeight.w600, color: kPrimaryColor),
                ),
                SizedBox(width: 5),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 12,
                  color: kPrimaryColor,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class ReviewsScreen extends StatelessWidget {
  final Product product;

  const ReviewsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final reviews = [
      Review(
        userInitials: "John Doe",
        comment:
            "The camera gear exceeded my expectations! Stunning quality and performance.",
        date: "10 Apr 2024",
        rating: 5,
      ),
      Review(
        userInitials: "Jane Smith",
        comment: "Great value for the money. I'm thrilled with the results!",
        date: "12 Apr 2024",
        rating: 4,
      ),
      Review(
        userInitials: "Michael Johnson",
        comment:
            "An excellent investment for any photographer. Highly recommend.",
        date: "14 Apr 2024",
        rating: 5,
      ),
      Review(
        userInitials: "Emily Davis",
        comment: "Good quality, but a bit heavy to carry around.",
        date: "15 Apr 2024",
        rating: 4,
      ),
      Review(
        userInitials: "David Martinez",
        comment:
            "I love the versatility and build quality of this camera gear.",
        date: "18 Apr 2024",
        rating: 5,
      ),
      Review(
        userInitials: "Sarah Lee",
        comment:
            "Captured some amazing shots with this gear. Totally worth it!",
        date: "20 Apr 2024",
        rating: 5,
      ),
      Review(
        userInitials: "Robert Brown",
        comment: "Decent gear, but had some issues with the lens focus.",
        date: "22 Apr 2024",
        rating: 3,
      ),
      Review(
        userInitials: "Linda Taylor",
        comment: "Fantastic product! Elevated my photography game.",
        date: "25 Apr 2024",
        rating: 5,
      ),
      Review(
        userInitials: "James Wilson",
        comment: "The gear is good, but I found it a bit overpriced.",
        date: "28 Apr 2024",
        rating: 3,
      ),
      Review(
        userInitials: "Jessica White",
        comment: "Amazing quality and very user-friendly. I'm in love with it!",
        date: "30 Apr 2024",
        rating: 5,
      ),
    ];
    final ratingBreakdown = {5: 187, 4: 15, 3: 2, 2: 0, 1: 0};

    return Scaffold(
      appBar: AppBar(
        title: const Text("Rating and Reviews"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ReviewsSection(
              averageRating: 4.9,
              totalReviews: 204,
              ratingBreakdown: ratingBreakdown,
              reviews: reviews,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blueAccent,
              ),
              child: const Text("See All Reviews"),
            ),
          ),
        ],
      ),
    );
  }
}
