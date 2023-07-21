import 'package:flutter/material.dart';

class CustomTextFormFiled extends StatefulWidget {
  const CustomTextFormFiled({
    super.key,
    required this.title,
    required this.hintText,
    required this.controller,
    required this.spacing,
    this.ontap,
    this.isreadOnly = false,
    this.keyBoardType,
  });
  final String title;
  final String hintText;
  final TextEditingController controller;
  final double spacing;
  final Function()? ontap;
  final bool? isreadOnly;
  final TextInputType? keyBoardType;

  @override
  State<CustomTextFormFiled> createState() => _CustomTextFormFiledState();
}

class _CustomTextFormFiledState extends State<CustomTextFormFiled> {
  bool isObsureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: widget.spacing,
        ),
        Text(
          widget.title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: widget.spacing,
        ),
        TextFormField(
          onTap: widget.ontap,
          controller: widget.controller,
          readOnly: widget.isreadOnly ?? false,
          textInputAction: TextInputAction.next,
          keyboardType: widget.keyBoardType ?? TextInputType.text,
          // decoration: InputDecoration(
          //   hintStyle: const TextStyle(fontSize: 14),
          //   hintText: widget.hintText,
          //   fillColor: Colors.grey.shade200,
          // ),
          validator: (value) {
            if (widget.controller.text.isEmpty) {
              return "Field cannot be empty";
            } else {
              return null;
            }
          },
        ),
      ],
    );
  }
}
