import 'package:flutter/material.dart';

class UnorderedListItem extends StatelessWidget {
  String itemText;

  UnorderedListItem({required this.itemText});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 4, right: 8),
          child: Icon(
            Icons.circle,
            size: 10,
          ),
        ),
        Flexible(
          child: Text(
            itemText,
          ),
        ),
      ],
    );
  }
}
