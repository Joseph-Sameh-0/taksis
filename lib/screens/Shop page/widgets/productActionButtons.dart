import 'package:flutter/material.dart';
// import 'package:p9/Screens/Profile/profile.dart';

import '../../main_screen.dart';

Widget productActionButtons(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      children: [
        actionBar(Icons.shopping_cart_outlined, "Go to cart",
            [Color(0xFF3F92FF), Color(0xFF0B3689)], context,MainScreen(index: 2)),
        actionBar(Icons.ads_click, "Buy Now",
            [Color(0xFF71F9A9), Color(0xFF31B769)], context,Scaffold()), //////////////////
      ],
    ),
  );
}

Widget actionBar(IconData icon, String text, List<Color> gradientColors,
    BuildContext context, Widget screen) {
  return MaterialButton(
    onPressed: () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => screen,
        ),
      );
    },
    padding: EdgeInsets.zero,
    child: SizedBox(
      height: 60,
      child: Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  height: 50,
                  width: 130,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    shape: BoxShape.rectangle,
                    gradient: RadialGradient(
                      colors: gradientColors,
                      center: Alignment.topCenter,
                      radius: 2,
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: Text(
                        text,
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: gradientColors,
                  center: Alignment.center,
                  radius: 0.6,
                ),
              ),
              child: Center(
                  child: Icon(
                icon,
                color: Colors.white,
              )),
            ),
          ],
        ),
      ),
    ),
  );
}
