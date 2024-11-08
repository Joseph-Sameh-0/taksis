import 'package:flutter/material.dart';
import 'package:taksis/colors.dart';

import '../../shipping_addresses/shipping_addresses.dart';

class AddressSection extends StatelessWidget {
  const AddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 14, right: 14, top: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Delivery Address",
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: lightSecondaryColor),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: Material(
                  color: Colors.transparent,
                  textStyle: TextStyle(color: primaryColor),
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: lightSecondaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Address :",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 4),
                        Text("216 St Paul's Rd, London N1 2LL, UK"),
                        Text("Contact : +44-784232"),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  color: lightSecondaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: IconButton(
                  icon: const Icon(Icons.edit, color: primaryColor),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ShippingAddresses()));
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
