import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart' show SvgPicture;

Widget productsTopBar() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    child: Row(
      children: [
        const Expanded(
            child: Text(
          "Your wish list",
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.w500),
        )),
        IconButton(
          onPressed: () {},
          icon: Material(
            color: Colors.white,
            elevation: 2,
            borderRadius: BorderRadius.circular(5),
            child: SizedBox(
              width: 70,
              height: 30,
              child: Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text('Sort'),
                    const SizedBox(width: 4),
                    SvgPicture.asset("assets/icons/sort.svg"),
                  ],
                ),
              ),
            ),
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Material(
            color: Colors.white,
            elevation: 2,
            borderRadius: BorderRadius.circular(5),
            child: SizedBox(
              width: 70,
              height: 30,
              child: const Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Filter'),
                    SizedBox(width: 4),
                    Icon(Icons.filter_alt),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
