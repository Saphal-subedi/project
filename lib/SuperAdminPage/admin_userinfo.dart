// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class AdminUserInfo extends StatelessWidget {
  const AdminUserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "UserInfo",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue.shade300,
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {}),
    );
  }
}
