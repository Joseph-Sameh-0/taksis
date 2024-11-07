import 'package:flutter/material.dart';
import 'package:taksis/screens/my_app_bar.dart';
import 'package:taksis/static.dart';

import 'widgets/address_section.dart';
import 'widgets/shopping_list.dart';

class Cart extends StatelessWidget {
  void Function(int) onNavigate;

  Cart({super.key, required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(onNavigate: onNavigate),
      // AppBar(
      //   title: const Text(
      //     "Shopping Bag",
      //     style: TextStyle(color: Colors.black),
      //   ),
      //   backgroundColor: Colors.white,
      //   elevation: 0,
      //   centerTitle: true,
      // ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2.0),
        child: Column(
          children: [
            Expanded(
              child: Scrollbar(
                thickness: 8,
                radius: Radius.circular(20),
                interactive: true,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      addressSection(),
                      const SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 14.0),
                        child: const Text(
                          "Shopping List",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(height: 8),
                      // Container(color: Colors.red,height: 20,),
                      shoppingList(bagProducts)
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF45140E),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    // Handle payment button press
                  },
                  child: MaterialButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Scaffold())); ///////
                    },
                    child: const Text(
                      "Proceed to Payment",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            // MaterialButton(onPressed: () {}, child: Text("data"))
          ],
        ),
      ),
    );
  }
}
