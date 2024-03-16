// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:e_woda/SuperAdminPage/admin_birth_details.dart';
import 'package:e_woda/SuperAdminPage/get_birth_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

import 'get_birth_model.dart';

class AdminBirth extends StatefulWidget {
  const AdminBirth({super.key});

  @override
  State<AdminBirth> createState() => _AdminBirthState();
}

class _AdminBirthState extends State<AdminBirth> {
  var TotalItem;
  final getbirthurl =
      "https://hedgehog-ready-daily.ngrok-free.app/api/app/birth-registration/paged-and-sorted";
  Future<List<GetBirth>> getBirth() async {
    final response = await http.get(Uri.parse(getbirthurl));
    final body = jsonDecode(response.body);
    Logger().e("Birth Response is-------------- $body");

    List items = body['data']['items'];
    TotalItem = body['data']['totalCount'];
    List<GetBirth> data = items
        .map((e) => GetBirth(
              id: e['id'],
              fatherFullName: e['fatherFullName'],
              motherFullName: e['motherFullName'],
              childFullName: e['childFullName'],
            ))
        .toList();
    Logger().e(data);

    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Birth",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue.shade300,
      ),
      body: FutureBuilder<List<GetBirth>>(
        future: getBirth(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text("No data available "));
          } else {
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                decoration: BoxDecoration(
                  border: Border.all(),
                ),
                columnSpacing: 30, // Adjust column spacing as needed
                columns: [
                  DataColumn(label: Text('Children Full Name')),
                  DataColumn(label: Text('Father Name')),
                  DataColumn(label: Text('Mother Name')),
                ],
                rows: snapshot.data!.map((data) {
                  return DataRow(
                    cells: [
                      DataCell(Text(data.childFullName ?? '')),
                      DataCell(Text(data.fatherFullName ?? '')),
                      DataCell(Text(data.motherFullName ?? '')),
                    ],
                    onSelectChanged: (_) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsBirthPage(dataa: data),
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
      // FutureBuilder<List<GetBirth>>(
      //     future: getBirth(),
      //     builder: (context, snapshot) {
      //       if (snapshot.hasData) {
      //         return ListView.builder(
      //             itemCount: TotalItem,
      //             itemBuilder: (context, index) {
      //               final data = snapshot.data![index];

      //               return ExpansionTile(
      //                 title: Text("Full Name:-${data.childFullName}"),
      //                 children: [
      //                   Text("${data.id}"),
      //                   Row(
      //                     children: [
      //                       Expanded(child: Text("Father Name:")),
      //                       Expanded(child: Text("${data.fatherFullName}")),
      //                     ],
      //                   ),
      //                   Row(
      //                     children: [
      //                       Expanded(child: Text("Mother Name:")),
      //                       Expanded(child: Text("${data.motherFullName}")),
      //                     ],
      //                   ),
      //                 ],
      //               );
      //             });
      //       } else {
      //         CircularProgressIndicator();
      //       }
      //       return Text("Loading");
      //     }),
    );
  }
}
