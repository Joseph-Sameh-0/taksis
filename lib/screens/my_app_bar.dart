import 'package:flutter/material.dart';
import 'package:taksis/colors.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Function(int) onNavigate;
  String? title;

  MyAppBar({super.key, required this.onNavigate, this.title});

  @override
  Size get preferredSize => const Size.fromHeight(70);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: primaryColor,
      leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.menu_rounded,
          )),
      title: title != null
          ? Text(title!,style: TextStyle(color: lightSecondaryColor),)
          : Image.asset("assets/images/taksis_logo.png",
              height: 70, fit: BoxFit.fitHeight),
      centerTitle: true,
      elevation: 2,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 8),
          child: IconButton(
              onPressed: () {
                onNavigate(4);
              },
              icon: Image.asset("assets/images/avatar_logo.png", width: 50)),
        ),
      ],
      shadowColor: Colors.black,
      toolbarHeight: 70,
    );
  }
}
