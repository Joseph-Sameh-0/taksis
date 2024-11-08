import 'package:flutter/material.dart';
import 'package:taksis/colors.dart';

class CircularProfileImage extends StatelessWidget {
  final String imagePath;
  final double size;

  const CircularProfileImage({
    Key? key,
    required this.imagePath,
    this.size = 100.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        CircleAvatar(
          radius: size / 2,
          backgroundImage: AssetImage(imagePath),
        ),
        IconButton(
          onPressed: () {},
          padding: EdgeInsets.zero,
          icon: SizedBox(
            width: 50,
            height: 50,
            child: Stack(
              children: [
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: primaryColor,
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: lightSecondaryColor,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      // Adjust padding as needed
                      child: Icon(
                        Icons.edit, // Use edit icon or any other icon
                        color: primaryColor, // Icon color
                        size: 30, // Adjust icon size as needed
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
