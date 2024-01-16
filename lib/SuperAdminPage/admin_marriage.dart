// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class AdminMarriage extends StatelessWidget {
  const AdminMarriage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Marriage",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue.shade300,
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {}),
    );
  }
}
