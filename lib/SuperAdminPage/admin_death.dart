// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class AdminDeath extends StatelessWidget {
  const AdminDeath({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Death",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue.shade300,
      ),
    );
  }
}
