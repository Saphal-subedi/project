import 'package:flutter/material.dart';

class CustomSnackBar {
  CustomSnackBar({required this.context, required this.message});
  final BuildContext context;
  String message;

  void snackbar() {
    print("Snackbar is called");
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: Text(message),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 3),
          shape: StadiumBorder(),
          behavior: SnackBarBehavior.floating),
    );
  }
}
