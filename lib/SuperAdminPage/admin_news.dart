// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class AdminNews extends StatelessWidget {
  const AdminNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "News",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue.shade300,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
        backgroundColor: Colors.blue.shade300,
      ),
    );
  }
}
