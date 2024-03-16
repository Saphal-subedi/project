import 'package:e_woda/features/Services/services_localization.dart';
import 'package:flutter/material.dart';

class CustomImageTitleServices extends StatelessWidget {
  const CustomImageTitleServices({
    super.key,
    required this.index,
    required this.title,
  });
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
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 0.11 * height,
                  width: 0.30 * width,
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
          SizedBox(
            height: 30.0,
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
                color: Color(0xFFF4F5FC),
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
