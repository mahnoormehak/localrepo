import 'package:flutter/material.dart';

class ReviewsSection extends StatelessWidget {
  final double averageRating;
  final int totalReviews;
  final Map<int, int> ratingBreakdown;
  final List<Review> reviews;

  const ReviewsSection({
    super.key,
    required this.averageRating,
    required this.totalReviews,
    required this.ratingBreakdown,
    required this.reviews,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                averageRating.toString(),
                style: const TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: List.generate(
                      5,
                      (index) => Icon(
                        Icons.star,
                        color:
                            index < averageRating ? Colors.amber : Colors.grey,
                      ),
                    ),
                  ),
                  Text("$totalReviews reviews"),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          ...ratingBreakdown.entries.map((entry) {
            return Row(
              children: [
                Text("${entry.key} star"),
                const SizedBox(width: 10),
                Expanded(
                  child: LinearProgressIndicator(
                    value: entry.value / totalReviews,
                  ),
                ),
                const SizedBox(width: 10),
                Text("${entry.value}"),
              ],
            );
          }),
          const SizedBox(height: 20),
          ...reviews.map((review) {
            return Card(
              margin: const EdgeInsets.only(bottom: 10),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: Color.fromARGB(255, 116, 151, 211),
                          ),
                          child: Text(
                            review.userInitials,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(review.comment),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: List.generate(
                        5,
                        (index) => Icon(
                          Icons.star,
                          color: index < review.rating
                              ? Colors.amber
                              : Colors.grey,
                          size: 16,
                        ),
                      ),
                    ),
                    if (review.images != null && review.images!.isNotEmpty)
                      const SizedBox(height: 10),
                    if (review.images != null && review.images!.isNotEmpty)
                      Row(
                        children: review.images!
                            .map((imageUrl) => Padding(
                                  padding: const EdgeInsets.only(right: 8),
                                  child: Image.network(
                                    imageUrl,
                                    width: 50,
                                    height: 50,
                                  ),
                                ))
                            .toList(),
                      ),
                    const SizedBox(height: 10),
                    Text(review.date),
                  ],
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}

class Review {
  final String userInitials;
  final String comment;
  final String date;
  final int rating;
  final List<String>? images;

  Review({
    required this.userInitials,
    required this.comment,
    required this.date,
    required this.rating,
    this.images,
  });
}
