import 'package:flutter/material.dart';
import 'package:taksis/screens/Home%20Screen/Widgets/for_you.dart';

import '../../models/Category.dart';
import 'Widgets/all_categories_image_list.dart';
import 'Widgets/image_card_carousel.dart';
import 'Widgets/products.dart';
import 'Widgets/search.dart';
import '../my_app_bar.dart';

class HomePage extends StatelessWidget {
  final Function(int) onNavigate;

  const HomePage({super.key, required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xFFFDFDFD),
      appBar: MyAppBar(onNavigate: onNavigate),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 90),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Text(
                    "Welcome",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                  ),
                ),
                AllCategoriesImageList(items: myCategories),
                ImageCardCarousel(imageUrls: homeCards),
                forYou(),
                products(),
                // DealOfTheDay(onNavigate: onNavigate),
                // newArrivals(screenWidth),
                // sponsored(),
                // const SizedBox(
                //   height: 40,
                // ),
              ],
            ),
          ),
          Positioned(
            top: 16,
            left: 0,
            right: 0,
            child: searchBar(),
          ),
        ],
      ),
    );
  }
}

List<Category> myCategories = [
  Category("assets/images/categories/Beauty.png", "Beauty"),
  Category("assets/images/categories/Fashion.png", "Fashion"),
  Category("assets/images/categories/Kids.png", "Kids"),
  Category("assets/images/categories/Mens.png", "Mens"),
  Category("assets/images/categories/Womens.png", "Women's"),
  Category("assets/images/categories/Gifts.png", "Gifts"),
];

List<String> homeCards = [
  'assets/images/card.png',
  'assets/images/card.png',
  'assets/images/card.png',
];
