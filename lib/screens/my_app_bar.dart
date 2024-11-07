import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Function(int) onNavigate;

  MyAppBar({super.key, required this.onNavigate});

  @override
  Size get preferredSize => const Size.fromHeight(70);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFF45140E),
      leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.menu_rounded,
            color: Colors.white,
          )),
      title: Image.asset("assets/images/taksis_logo.png",
          height: 70, fit: BoxFit.fitHeight),
      centerTitle: true,
      elevation: 2,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 8),
          child: IconButton(
              onPressed: () {
                // Navigator.pushNamed(context, "/profile");
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
