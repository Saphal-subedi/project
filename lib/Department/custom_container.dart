import 'package:e_woda/Department/departments_localiation.dart';
import 'package:flutter/material.dart';

class CustomImageTitle extends StatelessWidget {
  CustomImageTitle({super.key, required this.index, required this.title});
  int index;
  String title;

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
              color: Color(0xFFF4E7E7),
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
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
          SizedBox(height: 10.0),
          Container(
            height: 30.0,
            child: Text(
              title,
              style: TextStyle(
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
