<<<<<<<< HEAD:lib/New Home Page/User Register Page/Drop Down Menu/drop_down_menu.dart
import 'package:e_woda/New%20Home%20Page/User%20Register%20Page/drop_down_list.dart';
========
import 'package:e_woda/features/authentication/User%20Register%20Page/drop_down_list.dart';
>>>>>>>> 33199bb4326b88636056f8972d9b98c9865841e9:lib/features/authentication/User Register Page/Drop Down Menu/drop_down_menu.dart
import 'package:flutter/material.dart';

final dl = DropDownList();

class CustomDropDownButton extends StatefulWidget {
  const CustomDropDownButton({super.key});

  @override
  State<CustomDropDownButton> createState() => _CustomDropDownButtonState();
}

class _CustomDropDownButtonState extends State<CustomDropDownButton> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        label: const Text("Blood Group"),
        hintText: "Select your blood group",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        focusedBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
      ),
      value: dropDownSelectedValue,
      onChanged: (value) {
        dropDownSelectedValue = value!;
        setState(() {});
      },
      items: bloodList.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
