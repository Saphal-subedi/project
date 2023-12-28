import 'package:flutter/material.dart';

class DrawerContent extends StatelessWidget {
  const DrawerContent({super.key, required this.title, required this.image});
  final String title;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              height: 30.0,
              decoration: const BoxDecoration(shape: BoxShape.circle),
              child: Image.asset(
                image,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 10.0),
            Text(
              title,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 17.0),
      ],
    );
  }
}
