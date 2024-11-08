import 'package:flutter/material.dart';
import 'package:taksis/colors.dart';

class PlaceOrder extends StatelessWidget {
  const PlaceOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF45140E),
        elevation: 0,
        title: const Text(
          "Place Order",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            productDetails(),
            const SizedBox(height: 20),
            couponSection(),
            const Divider(height: 30),
            orderPaymentDetails(),
            const Divider(height: 30),
            OrderDetailRow(
              label: "Order Total",
              value: "₹ 7,000.00",
              valueFontWeight: FontWeight.bold,
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Text(
                  "EMI  Available",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                const Text(
                  "Details",
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 8,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryColor,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text(
            "Save",
            style: TextStyle(fontSize: 16, color: lightSecondaryColor),
          ),
        ),
      ),
    );
  }
}

Widget orderPaymentDetails() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        "Order Payment Details",
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 12),
      OrderDetailRow(
        label: "Order Amounts",
        value: "₹ 7,000.00",
      ),
      OrderDetailRow(
        label: "Convenience",
        button: "Know More",
        value: "Apply Coupon",
        valueColor: Colors.red,
        // labelColor: Colors.grey,
      ),
      OrderDetailRow(
        label: "Delivery Fee",
        value: "Free",
        valueColor: Colors.red,
      ),
    ],
  );
}

Widget couponSection() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: const [
      Row(
        children: [
          Icon(Icons.local_offer_outlined, color: Colors.black),
          SizedBox(width: 8),
          Text("Apply Coupons", style: TextStyle(fontSize: 16)),
        ],
      ),
      Text("Select",
          style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
    ],
  );
}

Widget productDetails() {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          'assets/images/products/دف نحاس.png',
          width: 130,
          height: 130,
          fit: BoxFit.cover,
        ),
      ),
      const SizedBox(width: 16),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Women's Casual Wear",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            const Text(
              "Checked Single-Breasted Blazer",
              // style: TextStyle(color: Colors.grey),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                DropDownButton(label: "Size", lst: ["42", "44", "46"]),
                const SizedBox(width: 16),
                DropDownButton(label: "Qty", lst: [1, 2, 3, 4]),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const Text(
                  "Delivery by",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(
                  width: 10,
                ),
                const Text(
                  "10 May 2XXX",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ],
            ),
          ],
        ),
      ),
    ],
  );
}

class DropDownButton extends StatefulWidget {
  final String _label;
  final List<dynamic> _lst;
  dynamic value;

  DropDownButton({super.key, required String label, required List<dynamic> lst})
      : _lst = lst,
        _label = label,
        value = lst[0];

  @override
  State<DropDownButton> createState() => _DropDownButtonState();
}

class _DropDownButtonState extends State<DropDownButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: Color(0xFFF2F2F2),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            spreadRadius: 0,
            blurRadius: 5,
            offset: const Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            Text(widget._label),
            const SizedBox(width: 8),
            DropdownButton(
              value: widget.value,
              items: widget._lst.map((dynamic value) {
                return DropdownMenuItem(
                  value: value,
                  child: Text(value.toString()),
                );
              }).toList(),
              onChanged: (_) {
                setState(() {
                  widget.value = _;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

// Custom widget to display each row in Order Payment Details
class OrderDetailRow extends StatelessWidget {
  final String label;
  final String value;
  final Color? labelColor;
  final Color? valueColor;
  final FontWeight? valueFontWeight;
  final String? button;

  const OrderDetailRow({
    super.key,
    required this.label,
    required this.value,
    this.labelColor,
    this.valueColor,
    this.valueFontWeight,
    this.button,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                label,
                style: TextStyle(
                  color: labelColor ?? Colors.black,
                  fontSize: 16,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              if (button != null)
                MaterialButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {},
                  child: Text(
                    "$button",
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
            ],
          ),
          Text(
            value,
            style: TextStyle(
              color: valueColor ?? Colors.black,
              fontWeight: valueFontWeight ?? FontWeight.normal,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
