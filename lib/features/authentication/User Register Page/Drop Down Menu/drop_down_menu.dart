import 'package:e_woda/features/authentication/User%20Register%20Page/drop_down_list.dart';

import 'package:flutter/material.dart';

//final dl = DropDownList();

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
