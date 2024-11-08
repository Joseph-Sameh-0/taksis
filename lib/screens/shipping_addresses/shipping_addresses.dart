import 'package:flutter/material.dart';
import 'package:taksis/colors.dart';
import 'package:taksis/screens/add_shipping_address/add_shipping_address.dart';
import 'package:taksis/screens/my_app_bar.dart';
import 'package:taksis/static.dart';

import 'widgets/address_card.dart';

class ShippingAddresses extends StatefulWidget {

  const ShippingAddresses({super.key});

  @override
  State<ShippingAddresses> createState() => _ShippingAddressesState();
}

class _ShippingAddressesState extends State<ShippingAddresses> {
  int selectedAddressIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        title: Text('Shipping Address'),
        backgroundColor: primaryColor,
        foregroundColor: lightSecondaryColor,
        elevation: 0,
        centerTitle: true,
      ),
      body: ListView.separated(
        padding: EdgeInsets.all(16.0),
        itemCount: addresses.length,
        itemBuilder: (context, index) {
          final item = addresses[index];
          return AddressCard(
            address: item,
            isSelected: selectedAddressIndex == index,
            onSelect: () {
              setState(() {
                selectedAddressIndex = index;
              });
            },
          );
        },
        separatorBuilder: (context, index) =>
            Padding(padding: const EdgeInsets.all(8), child: Divider()),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: lightSecondaryColor,
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      AddShippingAddress()));
        },
        child: Icon(
          Icons.add,
          color: primaryColor,
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: lightSecondaryColor,
        child: MaterialButton(
          onPressed: () {
            Navigator.pop(context);
          },
          color: primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(8), // Adjust the radius as needed
          ),
          child: Text(
            "Save",
            style: TextStyle(color: lightSecondaryColor),
          ),
        ),
      ),
    );
  }
}
