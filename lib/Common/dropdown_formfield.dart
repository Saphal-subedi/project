import 'package:flutter/material.dart';

class CustomDropDownFormField extends StatelessWidget {
  const CustomDropDownFormField(
      {super.key,
      required this.items,
      this.onChanged,
      required this.value,
      required this.title});
  final List<String> items;
  final void Function(String?)? onChanged;
  final String value;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 12,
        ),
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 10,
        ),
        DropdownButtonFormField<String>(
            value: value,
            items: items.map<DropdownMenuItem<String>>((e) {
              return DropdownMenuItem(
                value: e,
                child: Text(e),
              );
            }).toList(),
            onChanged: onChanged),
      ],
    );
  }
}
