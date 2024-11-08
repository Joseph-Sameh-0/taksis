
import 'package:flutter/material.dart';
import 'package:taksis/colors.dart';
import 'package:taksis/models/address.dart';
import 'package:taksis/screens/add_shipping_address/add_shipping_address.dart';

import '../shipping_addresses.dart';

class AddressCard extends StatelessWidget {
  final Address address;

  final bool isSelected;
  final VoidCallback onSelect;

  const AddressCard({
    required this.address,
    required this.isSelected,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: lightPrimaryColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                address.name,
                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: secondaryColor),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AddShippingAddress()));
                },
                child: Text(
                  'Edit',
                  style: TextStyle(
                      color: primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Text(address.address,style: TextStyle(color: secondaryColor),),
          Text("${address.city}, ${address.state}, ${address.country}",style: TextStyle(color: secondaryColor),),
          SizedBox(height: 12),
          Row(
            children: [
              Radio(
                value: true,
                groupValue: isSelected,
                activeColor: primaryColor,
                onChanged: (value) => onSelect(),
              ),
              Text('Use as the shipping address',style: TextStyle(color: secondaryColor),),
            ],
          ),
        ],
      ),
    );
  }
}
