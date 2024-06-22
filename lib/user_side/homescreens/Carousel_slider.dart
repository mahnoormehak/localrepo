// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class MyCarouselSlider extends StatelessWidget {
  final List<String> imagePaths = [
    "assets/images/sony_alpha9_1.png",
    "assets/images/dji_mavic_1.png",
    "assets/images/dji_ronin_1.png",
    "assets/images/dji_gimble_1.png",
  ];

  MyCarouselSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, // Align text to the left
      children: [
        const Padding(
          padding:
              EdgeInsets.symmetric(horizontal: 16), // Add padding to the text
          child: Text(
            "Trending Products",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 10),
        CarouselSlider.builder(
          itemCount: imagePaths.length,
          options: CarouselOptions(
            height: 200,
            aspectRatio: 16 / 9,
            viewportFraction:
                0.9, // Reduce viewport fraction to make images smaller
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 2),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            enlargeStrategy: CenterPageEnlargeStrategy.height,
          ),
          itemBuilder: (BuildContext context, int index, int pageViewIndex) {
            return SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                    10), // Add border radius for a rounded look
                child: Image.asset(
                  imagePaths[index],
                  fit: BoxFit.cover, // Ensure the image fits properly
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
