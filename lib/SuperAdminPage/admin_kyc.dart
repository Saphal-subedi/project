import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'admin_Kyc_model.dart';

import 'kyc_status_details.dart';

class AdminKyc extends StatelessWidget {
  final String getuserdetailsurl =
      "https://hedgehog-ready-daily.ngrok-free.app/api/app/user-management/pending-kyc";

  Future<List<KycStatusModel>> getKycStatus() async {
    final response = await http.get(Uri.parse(getuserdetailsurl));
    final body = jsonDecode(response.body);
    List<dynamic> items = body['data'];
    List<KycStatusModel> data =
        items.map((e) => KycStatusModel.fromJson(e)).toList();
    return data;
  }

  AdminKyc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Kyc details",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue.shade300,
      ),
      body: FutureBuilder<List<KycStatusModel>>(
        future: getKycStatus(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text("No data available"));
          } else {
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                decoration: BoxDecoration(
                  border: Border.all(),
                ),
                columnSpacing: 30, // Adjust column spacing as needed
                columns: [
                  DataColumn(label: Text('Email')),
                  DataColumn(label: Text('Name')),
                  DataColumn(label: Text('Phone Number')),
                ],
                rows: snapshot.data!.map((data) {
                  return DataRow(
                    cells: [
                      DataCell(Text(data.memberEmail ?? '')),
                      DataCell(Text(data.memberName ?? '')),
                      DataCell(Text(data.phoneNumber ?? '')),
                    ],
                    onSelectChanged: (_) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsPage(dataa: data),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
            );
          }
        },
      ),
    );
  }
}
