import 'package:flutter/material.dart';

Widget addressSection() {
  return Padding(
    padding: const EdgeInsets.only(left: 14,right: 14,top: 8),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Delivery Address",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
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
            const SizedBox(width: 8),
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: IconButton(icon: const Icon(Icons.edit, color: Colors.black), onPressed: () {
              },),
            ),
          ],
        ),
      ],
    ),
  );
}
