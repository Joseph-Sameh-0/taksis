import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/images/background.jpg",
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
        Center(
            child: Image.asset("assets/images/taksis_logo.png")),
      ],
    );
  }
}
