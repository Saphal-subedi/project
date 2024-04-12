import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    this.obsecureText,
    required this.hintText,
    required this.textController,
    this.validate,
    this.textInputType,
    this.showPassword = false,
  });

  final String hintText;
  final TextEditingController textController;
  final bool? obsecureText;
  final String? Function(String?)? validate;
  final TextInputType? textInputType;
  final bool showPassword;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.textInputType ?? TextInputType.text,
      controller: widget.textController,
      obscureText: widget.obsecureText ?? false,
      decoration: InputDecoration(
        label: Text(widget.hintText),
        hintText: widget.hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        focusedBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
      ),

      validator: widget.validate,

      // onChanged: onChanged,
    );
  }
}
