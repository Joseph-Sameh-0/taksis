import 'package:flutter/material.dart';
import 'package:taksis/colors.dart';


class AddShippingAddress extends StatelessWidget {
  const AddShippingAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        title: Text('Adding Shipping Address'),
        backgroundColor: primaryColor,
        foregroundColor: lightSecondaryColor,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              _buildTextField('Address Name', 'address name'),
              SizedBox(height: 16),
              _buildTextField('Address', '3 Newbridge Court'),
              SizedBox(height: 16),
              _buildTextField('City', 'Chino Hills'),
              SizedBox(height: 16),
              _buildTextField('State', 'California'),
              SizedBox(height: 16),
              _buildDropdownField('Country', 'Select Country'),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: lightPrimaryColor,
        child: ElevatedButton(
          onPressed: () {
            // Handle save address action
            Navigator.pop(context);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryColor,
            minimumSize: Size(double.infinity, 48),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Text(
            'SAVE ADDRESS',
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: lightSecondaryColor),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, String hint) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: lightSecondaryColor,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 4),
        TextField(
          decoration: InputDecoration(
            hintText: hint,
            contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            filled: true,
            fillColor: Colors.white,
          ),
        ),
      ],
    );
  }
}

Widget _buildDropdownField(String label, String hint) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: TextStyle(
          color: lightSecondaryColor,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      SizedBox(height: 4),
      DropdownButtonFormField<String>(
        items: [
          'United States',
          'Canada',
          'Mexico'
        ] // Add more countries as needed
            .map((country) => DropdownMenuItem<String>(
                  value: country,
                  child: Text(country),
                ))
            .toList(),
        onChanged: (value) {
          // Handle country selection
        },
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
          filled: true,
          fillColor: Colors.white,
        ),
        hint: Text(hint),
      ),
    ],
  );
}
