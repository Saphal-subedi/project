import 'dart:convert';
import 'dart:typed_data';

import 'package:e_woda/SuperAdminPage/get_birth_model.dart';
import 'package:e_woda/SuperAdminPage/get_marriage_model.dart';
import 'package:flutter/material.dart';

class DetailsMarriagePage extends StatelessWidget {
  final GetMarriage data;

  DetailsMarriagePage({required this.data});
//   DetailsBirthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Marriage Details"),
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Husband Name:-${data.husbandFullName}"),
              SizedBox(height: 10.0),
              Text("Husband Date Of Birth:-${data.husbandBirthDate}"),
              SizedBox(height: 10.0),
              Text("Wife Name:-${data.wifeFullName}"),
              SizedBox(height: 10.0),
              Text("Wife Date Of Birth:-${data.wifeBirthDate}"),
              SizedBox(height: 10.0),
              Text("Date Of Marriage:-${data.dateOfMarriage}"),
              SizedBox(height: 10.0),
              Text("Marriage Type:-${data.marriageType}"),
              SizedBox(height: 10.0),
              Text("Place Of Marriage:-${data.placeOfMarriage}"),
              SizedBox(height: 10.0),
              Text("User Id:-${data.id}"),
              SizedBox(height: 10.0),
              // Row(
              //   children: [
              //     Spacer(),
              //     Container(
              //       decoration: BoxDecoration(
              //         border: Border.all(color: Colors.black), // Add border
              //         borderRadius: BorderRadius.circular(
              //             8), // Optional: Add border radius
              //         color: Colors.green, // Change background color
              //       ),
              //       child: TextButton(
              //         onPressed: () {},
              //         child: Padding(
              //           padding: const EdgeInsets.all(20.0),
              //           child: Text(
              //             "Accept",
              //             style: TextStyle(
              //                 color:
              //                     Colors.white), // Optional: Change text color
              //           ),
              //         ),
              //       ),
              //     ),
              //     Spacer(),
              //     Container(
              //       decoration: BoxDecoration(
              //         border: Border.all(color: Colors.black), // Add border
              //         borderRadius: BorderRadius.circular(
              //             8), // Optional: Add border radius
              //         color: Colors.red, // Change background color
              //       ),
              //       child: TextButton(
              //         onPressed: () {
              //           // Add onPressed functionality here
              //         },
              //         child: Padding(
              //           padding: EdgeInsets.all(20.0),
              //           child: Text(
              //             "Reject",
              //             style: TextStyle(
              //                 color:
              //                     Colors.white), // Optional: Change text color
              //           ),
              //         ),
              //       ),
              //     ),
              //     Spacer(),
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
