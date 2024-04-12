import 'dart:convert';

import 'package:e_woda/SuperAdminPage/get_birth_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class DetailsBirthPage extends StatefulWidget {
  final GetBirth dataa;

  DetailsBirthPage({required this.dataa});

  @override
  State<DetailsBirthPage> createState() => _DetailsBirthPageState();
}

class _DetailsBirthPageState extends State<DetailsBirthPage> {
  Future<BirthDetailsModel> getPersonalDetailss() async {
    Logger().e("Function Is Called");
    String uid = widget.dataa.id ?? "";
    Logger().e("The uid of person is ----------$uid");
    final String getuserdetailsurl =
        "https://hedgehog-ready-daily.ngrok-free.app/api/app/birth-registration/$uid";
    final response = await http.get(Uri.parse(getuserdetailsurl));

    final body = jsonDecode(response.body);

    final items = body['data'];
    BirthDetailsModel data = BirthDetailsModel.fromJson(items);
    Logger().e(":::::::::::::::${data.id}");

    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.dataa.childFullName}"),
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: FutureBuilder<BirthDetailsModel>(
        future: getPersonalDetailss(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data == null) {
            return Center(child: Text("No data available"));
          } else {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Child Full Name:-${snapshot.data!.childFullName}"),
                    SizedBox(height: 10.0),
                    Text("Date Of Birth:-${snapshot.data!.birthDate}"),
                    SizedBox(height: 10.0),
                    Text("Father Name:-${snapshot.data!.fatherFullName}"),
                    SizedBox(height: 10.0),
                    Text("Mother Name:-${snapshot.data!.motherFullName}"),
                    SizedBox(height: 10.0),
                    Text("Gender:-${snapshot.data!.gender}"),
                    SizedBox(height: 10.0),
                    Text("Place Of Birth:-${snapshot.data!.placeOfBirth}"),
                    SizedBox(height: 10.0),
                    Text("Person Id:-${snapshot.data!.id}"),
                    SizedBox(height: 10.0),
                    // Row(
                    //   children: [
                    //     Spacer(),
                    //     Container(
                    //       decoration: BoxDecoration(
                    //         border:
                    //             Border.all(color: Colors.black), // Add border
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
                    //                 color: Colors
                    //                     .white), // Optional: Change text color
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //     Spacer(),
                    //     Container(
                    //       decoration: BoxDecoration(
                    //         border:
                    //             Border.all(color: Colors.black), // Add border
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
                    //                 color: Colors
                    //                     .white), // Optional: Change text color
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
            );
          }
        },
      ),
    );
  }
}

class BirthDetailsModel {
  String? id;
  String? childFullName;
  String? birthDate;
  String? placeOfBirth;
  String? gender;
  String? fatherFullName;
  String? motherFullName;
  String? relationType;

  BirthDetailsModel(
      {this.id,
      this.childFullName,
      this.birthDate,
      this.placeOfBirth,
      this.gender,
      this.fatherFullName,
      this.motherFullName,
      this.relationType});

  BirthDetailsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    childFullName = json['childFullName'];
    birthDate = json['birthDate'];
    placeOfBirth = json['placeOfBirth'];
    gender = json['gender'];
    fatherFullName = json['fatherFullName'];
    motherFullName = json['motherFullName'];
    relationType = json['relationType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['childFullName'] = this.childFullName;
    data['birthDate'] = this.birthDate;
    data['placeOfBirth'] = this.placeOfBirth;
    data['gender'] = this.gender;
    data['fatherFullName'] = this.fatherFullName;
    data['motherFullName'] = this.motherFullName;
    data['relationType'] = this.relationType;
    return data;
  }
}
