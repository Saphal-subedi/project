// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class NavigateAppBar extends StatelessWidget {
  NavigateAppBar({super.key, required this.title});
  String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: Text(title),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios)));
  }
}
