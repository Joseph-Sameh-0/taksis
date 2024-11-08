import 'dart:async';

import 'package:flutter/material.dart';
import 'package:loop_page_view/loop_page_view.dart'; // Import
import 'package:taksis/colors.dart';

import '../../../models/Category.dart';

class AllCategoriesImageList extends StatefulWidget {
  final LoopPageController controller =
      LoopPageController(viewportFraction: 0.2);
  final List<Category> items;

  AllCategoriesImageList({super.key, required this.items});

  @override
  State<AllCategoriesImageList> createState() => _AllCategoriesImageListState();
}

class _AllCategoriesImageListState extends State<AllCategoriesImageList> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(const Duration(seconds: 2), (Timer timer) {
      widget.controller.nextPage(
          duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: LoopPageView.builder(
        controller: widget.controller,
        scrollDirection: Axis.horizontal,
        itemCount: widget.items.length,
        itemBuilder: (context, index) {
          final item = widget
              .items[index % widget.items.length]; // Use modulo for circularity
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage(item.image),
                ),
                const SizedBox(height: 8),
                Text(item.title,style: TextStyle(color: lightSecondaryColor),),
              ],
            ),
          );
        },
      ),
    );
  }
}
