import 'package:flutter/material.dart';
import 'package:taksis/screens/Home%20Screen/Widgets/for_you.dart';
import 'package:taksis/colors.dart';
import '../../models/Category.dart';
import '../../static.dart';
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
      backgroundColor: primaryColor,
      appBar: MyAppBar(onNavigate: onNavigate),
      body: Stack(
        children: [
          // Image.asset("assets/images/background.jpg",width: double.infinity,height: double.infinity,fit: BoxFit.cover,),
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
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500,color: lightSecondaryColor),
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

