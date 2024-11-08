import 'package:flutter/material.dart';

class Checkout extends StatefulWidget {
  const Checkout({super.key});

  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  int _selectedPaymentIndex = 0;

  final List<List<String>> _paymentMethods = [
    ["assets/images/payments/paypal.png", "********2109"],
    ["assets/images/payments/maestro.png", "********2109"],
    ["assets/images/payments/apple.png", "********2109"],
    ["assets/images/payments/visa.png", "********2109"],
  ];

  void _onPaymentMethodSelected(int index) {
    setState(() {
      _selectedPaymentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Checkout",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Order Summary Section
            OrderSummaryRow(label: "Order", amount: "₹ 7,000"),
            OrderSummaryRow(label: "Shipping", amount: "₹ 30"),
            OrderSummaryRow(
              label: "Total",
              amount: "₹ 7,030",
              isBold: true,
            ),
            const SizedBox(height: 10),
            const Divider(),
            const SizedBox(height: 10),

            // Payment Section
            const Text(
              "Payment",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            const SizedBox(height: 10),

            Expanded(
              child: ListView.separated(
                itemCount: _paymentMethods.length,
                itemBuilder: (context, index) {
                  return PaymentMethodCard(
                    image: _paymentMethods[index][0],
                    number: _paymentMethods[index][1],
                    isSelected: _selectedPaymentIndex == index,
                    onTap: () => _onPaymentMethodSelected(index),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: 15,
                  );
                },
              ),
            ),
          ],
        ),
      ),

      // Bottom Continue Button
      bottomNavigationBar: BottomAppBar(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: () {
            // Handle continue button press
          },
          child: const Text(
            "Continue",
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

// Custom widget for Order Summary Row
class OrderSummaryRow extends StatelessWidget {
  final String label;
  final String amount;
  final bool isBold;

  const OrderSummaryRow({
    Key? key,
    required this.label,
    required this.amount,
    this.isBold = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              color: isBold ? Colors.black : Colors.grey,
              fontSize: isBold ? 20 : 18,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            amount,
            style: TextStyle(
              color: Colors.black,
              fontSize: isBold ? 18 : 16,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}

// Custom widget for Payment Method Card
class PaymentMethodCard extends StatelessWidget {
  final String number;
  final bool isSelected;
  final String image;
  final VoidCallback onTap;

  const PaymentMethodCard({
    super.key,
    required this.number,
    required this.isSelected,
    required this.image,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(
            color: isSelected ? Colors.red : Colors.transparent,
            width: 1.5,
          ),
        ),
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                image,
                width: 80,
                height: 40,
                alignment: Alignment.centerLeft,
                fit: BoxFit.contain,
              ),
              Text(
                number,
                style: const TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }

// String _getPaymentIcon(String type) {
//   switch (type) {
//     case "VISA":
//       return 'assets/images/payments/visa.png'; // Replace with actual asset paths
//     case "PayPal":
//       return 'assets/images/payments/paypal.png';
//     case "MasterCard":
//       return 'assets/images/payments/maestro.png';
//     case "Apple Pay":
//       return 'assets/images/payments/apple.png';
//     default:
//       return 'assets/images/payments/visa.png';
//   }
// }
}
