import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    super.key,
    this.obsecureText,
    required this.hintText,
    required this.textController,
    this.validate,
    this.textInputType,
  });

  String hintText;
  TextEditingController textController = TextEditingController();
  bool? obsecureText;
  String? Function(String?)? validate;
  TextInputType? textInputType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: textInputType ?? TextInputType.text,
      controller: textController,
      obscureText: obsecureText ?? false,
      decoration: InputDecoration(
        label: Text(hintText),
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        focusedBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
      ),

      validator: validate,

      // onChanged: onChanged,
    );
  }
}
