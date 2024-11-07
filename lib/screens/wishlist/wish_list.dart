import 'package:flutter/material.dart';

import '../Home Screen/Widgets/products.dart';
import 'products_top_bar.dart';
import '../my_app_bar.dart';

class WishList extends StatelessWidget {
  final Function(int) onNavigate;

  const WishList({super.key, required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(onNavigate: onNavigate),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            productsTopBar(),
            Expanded(
              child: Scrollbar(
                thickness: 8,
                radius: Radius.circular(20),
                interactive: true,
                child: SingleChildScrollView(
                  child: products(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
