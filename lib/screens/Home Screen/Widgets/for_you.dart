import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taksis/colors.dart';

Widget forYou() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    child: Row(
      children: [
        const Expanded(
            child: Text(
          "For You",
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.w500, color: lightSecondaryColor),
        )),
        IconButton(
          onPressed: () {},
          icon: Material(
            color: lightSecondaryColor,
            elevation: 2,
            borderRadius: BorderRadius.circular(5),
            child: Container(
              width: 70,
              height: 30,
              child: Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text('Sort',style: TextStyle(color: primaryColor),),
                    const SizedBox(width: 4),
                    SvgPicture.asset("assets/icons/sort.svg",),
                  ],
                ),
              ),
            ),
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Material(
            color: lightSecondaryColor,
            elevation: 2,
            borderRadius: BorderRadius.circular(5),
            child: Container(
              width: 70,
              height: 30,
              child: const Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Filter',style: TextStyle(color: primaryColor),),
                    SizedBox(width: 4),
                    Icon(Icons.filter_alt,color: primaryColor,),
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
