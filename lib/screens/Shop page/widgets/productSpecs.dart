import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../models/Product.dart';

Widget productSpecs(Product product) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(product.title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
        Text(product.subtitle, style: TextStyle(fontSize: 16)),
        const SizedBox(height: 8),
        Row(
          children: [
            RatingBar.builder(
              initialRating: product.rating,
              // minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              ignoreGestures: true,
              itemSize: 20,
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
        const SizedBox(height: 8),
        Row(
          children: [
            Text(
              '₹${product.price}',
              style: const TextStyle(
                  color: Colors.grey,
                  decoration: TextDecoration.lineThrough,
                  fontSize: 18),
            ),
            const SizedBox(width: 8),
            Text(
              '₹${product.price * product.discount / 100}',
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 18),
            ),
            const SizedBox(width: 8),
            Text(
              '${product.discount}% Off',
              style: const TextStyle(color: Colors.red, fontSize: 18),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text("Product Details",
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        Text(
            product.details),
        // productFeatures(),
      ],
    ),
  );
}
