import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../static.dart';
import 'product_card_for_grid.dart';

Widget products() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0),
    child: MasonryGridView.count(
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      mainAxisSpacing: 5,
      crossAxisSpacing: 5,
      shrinkWrap: true,
      itemCount: productsList.length,
      itemBuilder: (context, index) {
        return ProductCardForGrid(product: productsList[index]);
      },
    ),
  );
}
