import 'package:flutter/material.dart';
// import '../../../Model/Product.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taksis/colors.dart';

import '../../../models/Product.dart';
import '../../payment/place_order/place_order.dart';

// import '../../place_order/place_order.dart';

class CartCard extends StatefulWidget {
  final Product product;

  CartCard({super.key, required this.product});

  @override
  State<CartCard> createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  int counter = 1;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PlaceOrder())); ///////////////////////
      },
      child: Card(
        color: lightPrimaryColor,
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product Image
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      widget.product.images[0],
                      width: 120,
                      height: 120,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 12),

                  // Product Details
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.product.title,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "Variations : Black, Red",
                          style: const TextStyle(color: Colors.grey),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Text(
                              widget.product.rating.toString(),
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(width: 4),
                            RatingBar.builder(
                              initialRating: widget.product.rating,
                              // minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              ignoreGestures: true,
                              itemSize: 15,
                              itemBuilder: (context, _) => const Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating) {
                                print(rating);
                              },
                            ),
                            // Icon(Icons.star, color: Colors.orange[400], size: 16),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                // Add a border
                                borderRadius: BorderRadius.circular(
                                    5.0), // Optional: Add rounded corners
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 5.0, vertical: 3),
                                child: Text(
                                  "\$${widget.product.price - (widget.product.price * widget.product.discount) / 100}",
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Column(
                              children: [
                                // const SizedBox(height: 8),
                                Text(
                                  "upto ${widget.product.discount}% off",
                                  style: const TextStyle(
                                      color: Colors.red, fontSize: 9),
                                ),
                                Text(
                                  "\$${widget.product.price}",
                                  style: const TextStyle(
                                    fontSize: 14,
                                    decoration: TextDecoration.lineThrough,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      "Total Order ($counter)   :",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: SvgPicture.asset(
                          "assets/icons/minus.svg",
                          width: 20,
                        ),
                        onPressed: () {
                          if (counter > 1) {
                            setState(() {
                              counter--;
                            });
                          }
                        },
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      IconButton(
                        icon: Icon(Icons.add_circle_outline_sharp,color: primaryColor,),
                        onPressed: () {
                          setState(() {
                            counter++;
                          });
                        },
                      ),
                    ],
                  ),
                  Expanded(
                    child: Text(
                      "\$ ${((widget.product.price - widget.product.price * widget.product.discount / 100) * counter).toStringAsFixed(2)}",
                      style: TextStyle(fontWeight: FontWeight.w500,),
                      textAlign: TextAlign.end,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
