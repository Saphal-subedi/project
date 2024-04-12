import 'package:flutter/material.dart';

customSnackbar(BuildContext context, String message) {
  final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: Colors.red,
      duration: const Duration(seconds: 7),
      shape: const StadiumBorder(),
      behavior: SnackBarBehavior.floating);
  return ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
