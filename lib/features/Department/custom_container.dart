import 'package:e_woda/features/Department/departments_localiation.dart';
import 'package:flutter/material.dart';

class CustomImageTitle extends StatelessWidget {
  const CustomImageTitle({super.key, required this.index, required this.title});
  final int index;
  final String title;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    double padding = width * 0.005;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
<<<<<<< HEAD:lib/Department/custom_container.dart
              color: Colors.transparent,
=======
              color: const Color(0xFFF4E7E7),
>>>>>>> 33199bb4326b88636056f8972d9b98c9865841e9:lib/features/Department/custom_container.dart
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 0.06 * height,
                  width: 0.15 * width,
                  child: Center(
                    child: Image.asset(
                      imgString[index].images,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10.0),
          SizedBox(
            height: 30.0,
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
