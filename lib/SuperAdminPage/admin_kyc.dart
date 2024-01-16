// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class AdminKyc extends StatelessWidget {
  const AdminKyc({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Kyc details",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue.shade300,
      ),
    );
  }
}
