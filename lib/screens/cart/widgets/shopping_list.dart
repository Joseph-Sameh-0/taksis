import 'package:flutter/material.dart';
import '../../../models/Product.dart';
import 'cart_card.dart';

Widget shoppingList(List<Product> bagProducts) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 14.0),
    child: ListView.separated(
      itemCount: bagProducts.length,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return cartCard(bagProducts[index], context);
      },
      separatorBuilder: (context, index) {
        return const Divider(); // Add a divider between items
      },
    ),
  );
}
