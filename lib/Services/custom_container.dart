import 'package:e_woda/Department/departments_localiation.dart';
import 'package:e_woda/Services/services_localization.dart';
import 'package:flutter/material.dart';

class CustomImageTitleServices extends StatelessWidget {
  CustomImageTitleServices({
    super.key,
    required this.index,
    required this.title,
  });
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
              color: const Color(0xFFF4E7E7),
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 0.11 * height,
                  width: 0.20 * width,
                  child: Center(
                    child: Image.asset(
                      servicesString[index].images,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10.0),
          Container(
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
