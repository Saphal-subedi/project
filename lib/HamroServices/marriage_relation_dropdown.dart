import 'package:flutter/material.dart';

String? marriageSelectedValue;

class MarriageTypeDropDown extends StatefulWidget {
  const MarriageTypeDropDown({super.key});

  @override
  State<MarriageTypeDropDown> createState() => _MarriageTypeDropDownState();
}

class _MarriageTypeDropDownState extends State<MarriageTypeDropDown> {
  String selectedValue = 'Arrange';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      isExpanded: true,
      value: selectedValue,
      onChanged: (String? newValue) {
        setState(() {
          selectedValue = newValue!;
          marriageSelectedValue = selectedValue;
        });
      },
      items: <String>['Arrange', 'Love', 'Other']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
