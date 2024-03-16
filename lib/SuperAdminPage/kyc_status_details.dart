import 'dart:convert';
import 'dart:typed_data';

import 'package:e_woda/Common/custom_snackbar.dart';
import 'package:e_woda/features/authentication/User%20Login%20Page/login_user_page.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'admin_Kyc_model.dart';
import 'package:http/http.dart' as http;

class DetailsPage extends StatefulWidget {
  final KycStatusModel dataa;

  DetailsPage({required this.dataa});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  Future<UserKycDetails> getPersonalDetails() async {
    final uid = widget.dataa.id;
    final String getuserdetailsurl =
        "https://hedgehog-ready-daily.ngrok-free.app/api/app/user-management/$uid";
    final response = await http.get(Uri.parse(getuserdetailsurl));

    final body = jsonDecode(response.body);

    final items = body['data'];
    UserKycDetails data = UserKycDetails.fromJson(items);

    Logger().e("The data is $data");
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${widget.dataa.userName} Kyc ",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder<UserKycDetails>(
        future: getPersonalDetails(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data == null) {
            return Center(child: Text("No data available"));
          } else {
            String imgsrc = snapshot.data!.documentImage!;

            return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildDetailRow('Name', snapshot.data!.name),
                  _buildDetailRow('Surname', snapshot.data!.surname),
                  _buildDetailRow('User Name', snapshot.data!.userName),
                  _buildDetailRow('Middle Name', snapshot.data!.middleName),
                  _buildDetailRow('Email', snapshot.data!.email),
                  _buildDetailRow('Phone Number', snapshot.data!.phoneNumber),
                  _buildDetailRow(
                      'Blood Group Name', snapshot.data!.bloodGroupName),
                  _buildDetailRow('ID Card No', snapshot.data!.idCardNo),
                  _buildDetailRow('Document Type', snapshot.data!.documentType),
                  _buildDetailRow('Date of Birth', snapshot.data!.dob),
                  _buildDetailRow('Palika Name', snapshot.data!.palikaName),
                  _buildDetailRow('Ward No', snapshot.data!.wardName),
                  _buildDetailRow(
                      'Ward Name', snapshot.data!.wardNo.toString()),
                  _buildDetailRow(
                      'Palika Type Name', snapshot.data!.palikaTypeName),
                  _buildDetailRow('City', snapshot.data!.city),
                  _buildDetailRow('State', snapshot.data!.state),
                  _buildDetailRow('Country', snapshot.data!.country),
                  _buildDetailRow('Gender', snapshot.data!.gender),
                  _buildDetailRow('Role Name', snapshot.data!.roleName),
                  SizedBox(height: 20),
                  DecodedImage(
                      imageResponse: '${snapshot.data!.documentImage}'),
                  Row(
                    children: [
                      Spacer(),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black), // Add border
                          borderRadius: BorderRadius.circular(
                              8), // Optional: Add border radius
                          color: Colors.green, // Change background color
                        ),
                        child: TextButton(
                          onPressed: () {
                            acceptUser(widget.dataa.id.toString())
                                .whenComplete(() {
                              customSnackbar(context, "Successfully accepted");
                              Navigator.pop(context);
                              Navigator.pop(context);
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(
                              "Accept",
                              style: TextStyle(
                                  color: Colors
                                      .white), // Optional: Change text color
                            ),
                          ),
                        ),
                      ),
                      Spacer(),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black), // Add border
                          borderRadius: BorderRadius.circular(
                              8), // Optional: Add border radius
                          color: Colors.red, // Change background color
                        ),
                        child: TextButton(
                          onPressed: () {
                            RejectUser(widget.dataa.id.toString())
                                .whenComplete(() {
                              customSnackbar(context, "Successfully rejected");
                              Navigator.pop(context);
                              Navigator.pop(context);
                            });
                            // Add onPressed functionality here
                          },
                          child: Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Text(
                              "Reject",
                              style: TextStyle(
                                  color: Colors
                                      .white), // Optional: Change text color
                            ),
                          ),
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                  SizedBox(height: 40.0),
                ],
              ),
            );
          }
        },
      ),
    );
  }

  Widget _buildDetailRow(String label, String? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            Text(
              '$label:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.blue,
              ),
            ),
            SizedBox(width: 10),
            Text(
              value ?? 'N/A',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> RejectUser(String id) async {
    final response = await http.put(
        Uri.parse(
            "https://hedgehog-ready-daily.ngrok-free.app/api/app/status/$id/kyc-status"),
        headers: <String, String>{
          'Content-Type': 'application/json'
          // 'Accept': '*/*',
        },
        body: json.encode(
          <String, dynamic>{"newStatus": "Rejected", "id": id},
        ));
    Logger().e(response.body);
  }

  Future<void> acceptUser(String id) async {
    Logger().e(id);
    Logger().e("Button is pressed");
    final response = await http.put(
        Uri.parse(
            "https://hedgehog-ready-daily.ngrok-free.app/api/app/status/$id/kyc-status"),
        headers: <String, String>{
          'Content-Type': 'application/json',

          // 'Accept': '*/*',
        },
        body: json.encode(<String, dynamic>{"newStatus": "Accepted"}));
    Logger().e(response.body);
  }
}

class UserKycDetails {
  String? userId;
  String? name;
  String? userName;
  String? surname;
  String? middleName;
  String? email;
  String? phoneNumber;
  String? bloodGroupName;
  String? documentImage;
  String? idCardNo;
  String? documentType;
  String? dob;
  String? palikaName;
  int? wardNo;
  String? wardName;
  String? palikaTypeName;
  String? city;
  String? state;
  String? country;
  String? gender;
  String? roleName;

  UserKycDetails(
      {this.userId,
      this.name,
      this.userName,
      this.surname,
      this.middleName,
      this.email,
      this.phoneNumber,
      this.bloodGroupName,
      this.documentImage,
      this.idCardNo,
      this.documentType,
      this.dob,
      this.palikaName,
      this.wardNo,
      this.wardName,
      this.palikaTypeName,
      this.city,
      this.state,
      this.country,
      this.gender,
      this.roleName});

  UserKycDetails.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    name = json['name'];
    userName = json['userName'];
    surname = json['surname'];
    middleName = json['middleName'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    bloodGroupName = json['bloodGroupName'];
    documentImage = json['documentImage'];
    idCardNo = json['idCardNo'];
    documentType = json['documentType'];
    dob = json['dob'];
    palikaName = json['palikaName'];
    wardNo = json['wardNo'];
    wardName = json['wardName'];
    palikaTypeName = json['palikaTypeName'];
    city = json['city'];
    state = json['state'];
    country = json['country'];
    gender = json['gender'];
    roleName = json['roleName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['name'] = this.name;
    data['userName'] = this.userName;
    data['surname'] = this.surname;
    data['middleName'] = this.middleName;
    data['email'] = this.email;
    data['phoneNumber'] = this.phoneNumber;
    data['bloodGroupName'] = this.bloodGroupName;
    data['documentImage'] = this.documentImage;
    data['idCardNo'] = this.idCardNo;
    data['documentType'] = this.documentType;
    data['dob'] = this.dob;
    data['palikaName'] = this.palikaName;
    data['wardNo'] = this.wardNo;
    data['wardName'] = this.wardName;
    data['palikaTypeName'] = this.palikaTypeName;
    data['city'] = this.city;
    data['state'] = this.state;
    data['country'] = this.country;
    data['gender'] = this.gender;
    data['roleName'] = this.roleName;
    return data;
  }
}

class DecodedImage extends StatelessWidget {
  final String imageResponse;

  DecodedImage({required this.imageResponse});

  @override
  Widget build(BuildContext context) {
    //  Uint8List bytes = base64.decode(imageResponse.split(',').last);
    Uint8List bytes = base64Decode(imageResponse);
    return Container(
      height: 100.0,
      width: 100.0,
      child: Image(
        image: MemoryImage(bytes),
        fit: BoxFit.fill,
      ),
    );
  }
}
