import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart' show SvgPicture;

Widget searchBar() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    child: Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Search any Product..',
            border: InputBorder.none,
            prefixIcon: const Icon(Icons.search),
            suffixIcon:
                SvgPicture.asset("assets/icons/mic.svg", fit: BoxFit.scaleDown),
          ),
        ),
      ),
    ),
  );
}
