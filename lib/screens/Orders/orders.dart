import 'package:flutter/material.dart';

import '../my_app_bar.dart';

class Orders extends StatelessWidget {
  final Function(int) onNavigate;

  const Orders({super.key, required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(onNavigate: onNavigate,),
      body: Placeholder(),
    );
  }
}
