import 'package:flutter/material.dart';

class DrawerContent extends StatelessWidget {
  DrawerContent({super.key, required this.title, required this.image});
  String title;
  String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              height: 30.0,
              decoration: BoxDecoration(shape: BoxShape.circle),
              child: Image.asset(
                image,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 10.0),
            Text(
              title,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        SizedBox(height: 17.0),
      ],
    );
  }
}
