import 'package:flutter/material.dart';

class CustomSnackBar {
  CustomSnackBar({required this.context, required this.message});
  final BuildContext context;
  String message;

  void snackbar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: Text(message),
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 3),
          shape: const StadiumBorder(),
          behavior: SnackBarBehavior.floating),
    );
  }
}
