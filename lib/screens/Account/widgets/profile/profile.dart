import 'package:flutter/material.dart';
import 'package:taksis/colors.dart';
import 'package:taksis/screens/shipping_addresses/shipping_addresses.dart';

import 'widgets/circular_profile_image.dart';
import 'widgets/personal_details.dart';

class Profile extends StatelessWidget {
  final Function() logout;
  final Function(int) onNavigate;

  const Profile({super.key, required this.logout, required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            children: [
              Center(
                child: CircularProfileImage(
                  imagePath: 'assets/images/avatar_logo.png',
                  size: 150.0,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              PersonalDetails(),
              Divider(
                indent: 20,
                endIndent: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ShippingAddresses()));
                },
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Card(
                    color: lightPrimaryColor,
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Shipping addresses",
                                  style: TextStyle(
                                      color: lightSecondaryColor, fontSize: 20),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "3 addresses",
                                  style: TextStyle(
                                      color: lightSecondaryColor, fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.arrow_forward_ios_outlined),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ShippingAddresses()));
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 8,
        height: 160,
        color: primaryColor,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  backgroundColor: lightPrimaryColor,
                  side: const BorderSide(color: lightSecondaryColor),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  textStyle: const TextStyle(fontSize: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: SizedBox(
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      'Save',
                      style: TextStyle(color: Colors.white, fontSize: 22),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: OutlinedButton(
                onPressed: logout,
                style: OutlinedButton.styleFrom(
                  backgroundColor: lightPrimaryColor,
                  side: const BorderSide(color: lightSecondaryColor),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  textStyle: const TextStyle(fontSize: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: SizedBox(
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      'Log Out',
                      style: TextStyle(color: Colors.white, fontSize: 22),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
