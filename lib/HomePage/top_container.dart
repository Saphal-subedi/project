import 'package:e_woda/HomePage/string_value/top_container.dart';
import 'package:flutter/material.dart';

class TopContainer extends StatelessWidget {
  const TopContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    // DateTimeModel dateTimeModel =
    //  Provider.of<DateTimeModel>(context, listen: false);
    return Container(
      width: double.infinity,
      height: height * 0.1,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "${WardInfo.wodaName}",
            style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w900),
          ),
          Text(
            "${WardInfo.districtName}",
            style: TextStyle(fontSize: 8.0, fontWeight: FontWeight.w900),
          ),
          // Consumer<DateTimeModel>(
          //       builder: (context, counterModel, child) {
          //         return Text(
          //           DateTimeModel.,
          //           style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          //         );
          //       },
          //     ),
          // Text(
          //  // dateTimeModel.dateTime.toString(),
          //   style: TextStyle(fontSize: 18),
          // ),
        ],
      ),
    );
  }
}
