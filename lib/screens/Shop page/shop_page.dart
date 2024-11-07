import 'package:flutter/material.dart';

import '../../static.dart';
import '../main_screen.dart';
import 'widgets/productActionButtons.dart';
import 'widgets/productImages.dart';
import 'widgets/productSpecs.dart';

class ShopPage extends StatelessWidget {
  final Function(int)? onNavigate;

  const ShopPage({super.key, this.onNavigate});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          MaterialButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => MainScreen(
                          index: 2,
                        )),
              );
            },
            child: Icon(Icons.shopping_cart_outlined),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProductImages(imageUrls: product.images),
            // ProductSizes(),
            productSpecs(product),
            productActionButtons(context),
            // productDeliveryTime(),
            // ProductOptions(),
            // similar(),
          ],
        ),
      ),
    );
  }
}
