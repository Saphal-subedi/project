// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:e_woda/SuperAdminPage/get_marriage_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

import 'admin_marriage_details.dart';

class AdminMarriage extends StatelessWidget {
  var TotalItem;
  final getmarriageurl =
      "https://hedgehog-ready-daily.ngrok-free.app/api/app/marriage-registration/paged-and-sorted";
  Future<List<GetMarriage>> getMarriage() async {
    final response = await http.get(Uri.parse(getmarriageurl));
    final body = jsonDecode(response.body);

    List items = body['data']['items'];
    TotalItem = body['data']['totalCount'];
    List<GetMarriage> data = items
        .map((e) => GetMarriage(
              id: e['id'],
              husbandFullName: e['husbandFullName'],
              wifeFullName: e['wifeFullName'],
              husbandBirthDate: e['husbandBirthDate'],
              wifeBirthDate: e['wifeBirthDate'],
              marriageType: e['marriageType'],
              placeOfMarriage: e['placeOfMarriage'],
              dateOfMarriage: e['dateOfMarriage'],
              marriageRegistrar: e['marriageRegistrar'],
            ))
        .toList();
    Logger().e(data);

    return data;
  }

  AdminMarriage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Marriage",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue.shade300,
      ),
      body: FutureBuilder<List<GetMarriage>>(
        future: getMarriage(),
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
                  DataColumn(label: Text('Husband Name')),
                  DataColumn(label: Text('Wife Name')),
                  DataColumn(label: Text('Marriage Date')),
                ],
                rows: snapshot.data!.map((data) {
                  return DataRow(
                    cells: [
                      DataCell(Text(data.husbandFullName ?? '')),
                      DataCell(Text(data.wifeFullName ?? '')),
                      DataCell(Text(data.dateOfMarriage ?? '')),
                    ],
                    onSelectChanged: (_) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsMarriagePage(data: data),
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
      // body: FutureBuilder<List<GetMarriage>>(
      //     future: getMarriage(),
      //     builder: (context, snapshot) {
      //       if (snapshot.hasData) {
      //         return ListView.builder(
      //             itemCount: TotalItem,
      //             itemBuilder: (context, index) {
      //               final data = snapshot.data![index];

      //               return ExpansionTile(
      //                 title: Column(
      //                   children: [
      //                     Text("Husband Name:-${data.husbandFullName}"),
      //                     Text("Wife Name:-${data.wifeFullName}"),
      //                   ],
      //                 ),
      //                 children: [
      //                   Text("Id=${data.id}"),
      //                   Row(
      //                     children: [
      //                       Expanded(child: Text("Husband birth date:")),
      //                       Expanded(child: Text("${data.husbandBirthDate}")),
      //                     ],
      //                   ),
      //                   Row(
      //                     children: [
      //                       Expanded(child: Text("Wife Birth date:")),
      //                       Expanded(child: Text("${data.wifeBirthDate}")),
      //                     ],
      //                   ),
      //                   Row(
      //                     children: [
      //                       Expanded(child: Text("Marriage Type:")),
      //                       Expanded(child: Text("${data.marriageType}")),
      //                     ],
      //                   ),
      //                   Row(
      //                     children: [
      //                       Expanded(child: Text("Place of Marriage:")),
      //                       Expanded(child: Text("${data.placeOfMarriage}")),
      //                     ],
      //                   ),
      //                   Row(
      //                     children: [
      //                       Expanded(child: Text("date of marriage:")),
      //                       Expanded(child: Text("${data.dateOfMarriage}")),
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
