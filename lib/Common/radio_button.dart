import 'package:flutter/material.dart';

enum Deformity { yes, no }

class CustomRadioButton extends StatelessWidget {
  const CustomRadioButton(
      {super.key,
      required this.value,
      required this.onChanged,
      required this.title,
      required this.groupValue});
  final Object value;
  final Object groupValue;
  final ValueChanged onChanged;
  final String title;

  @override
  Widget build(BuildContext context) {
    return RadioListTile.adaptive(
        title: Text(title),
        value: value,
        groupValue: groupValue,
        onChanged: onChanged);
  }
}
