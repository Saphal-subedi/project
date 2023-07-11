import 'package:e_woda/HomePage/top_container.dart';
import 'package:flutter/material.dart';

import 'custom_container.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {},
          ),
          Spacer(),
          CircleAvatar(
            backgroundColor: Colors.blue,
            radius: 20,
            child: Image.asset(
              "assets/images/ward info.png",
              fit: BoxFit.fitHeight,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            TopContainer(),
            CustomGridView(),
          ],
        ),
      ),
    );
  }
}
