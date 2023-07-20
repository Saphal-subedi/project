// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class NavigateAppBar extends StatelessWidget {
  const NavigateAppBar({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            color: Colors.blue.shade300,
          ),
        ),
        title: Text(title),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios)));
  }
}
