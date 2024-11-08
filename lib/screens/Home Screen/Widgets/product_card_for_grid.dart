import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:taksis/colors.dart';

import '../../../models/Product.dart';
import '../../Shop page/shop_page.dart';

class ProductCardForGrid extends StatelessWidget {
  const ProductCardForGrid({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double cardSize = screenWidth / 2 - 20;

    return GestureDetector(
      child: Card(
        color: lightPrimaryColor,
        elevation: 5,
        clipBehavior: Clip.antiAlias,
        child: SizedBox(
          width: cardSize,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  product.images[0],
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(product.subtitle),
                    const SizedBox(height: 8),
                    Text(
                      '₹${product.price * product.discount / 100}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          '₹${product.price}',
                          style: const TextStyle(
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '${product.discount}% Off',
                          style: const TextStyle(color: Colors.red),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        RatingBar.builder(
                          initialRating: product.rating,
                          // minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          ignoreGestures: true,
                          itemSize: 18,
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ),
                        // Placeholder rating
                        const SizedBox(width: 8),
                        Text('(${product.buyers})'),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        // Navigator.pushNamed(context, "/shop_page");
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ShopPage()));
      },
    );
  }
}
