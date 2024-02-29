// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:e_woda/SuperAdminPage/get_death_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

import 'admin_death_details.dart';

class AdminDeath extends StatelessWidget {
  const AdminDeath({super.key});

  @override
  Widget build(BuildContext context) {
    var TotalItem;
    final getbirthurl =
        "https://hedgehog-ready-daily.ngrok-free.app/api/app/death-registration/paged-and-sorted";
    Future<List<GetDeath>> getDeath() async {
      Logger().e("Value called");
      final response = await http.get(Uri.parse(getbirthurl));
      final body = jsonDecode(response.body);

      List items = body['data']['items'];
      TotalItem = body['data']['totalCount'];
      List<GetDeath> data = items
          .map((e) => GetDeath(
                id: e['id'],
                personFullName: e['personFullName'],
                placeOfDeath: e['placeOfDeath'],
                causeOfDeath: e['causeOfDeath'],
                deathTime: e['deathTime'],
              ))
          .toList();

      return data;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Death",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue.shade300,
      ),
      body: FutureBuilder<List<GetDeath>>(
        future: getDeath(),
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
                  DataColumn(label: Text('Full Name')),
                  DataColumn(label: Text('Place of Death')),
                  DataColumn(label: Text('Cause Of Death')),
                ],
                rows: snapshot.data!.map((data) {
                  return DataRow(
                    cells: [
                      DataCell(Text(data.personFullName ?? '')),
                      DataCell(Text(data.placeOfDeath ?? '')),
                      DataCell(Text(data.causeOfDeath ?? '')),
                    ],
                    onSelectChanged: (_) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsDeathPage(data: data),
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
      // body: FutureBuilder<List<GetDeath>>(
      //     future: getDeath(),
      //     builder: (context, snapshot) {
      //       if (snapshot.hasData) {
      // return ListView.builder(
      //     itemCount: TotalItem,
      //     itemBuilder: (context, index) {
      //       final data = snapshot.data![index];

      //       return ExpansionTile(
      //         title: Text("Person Name:-${data.personFullName}"),
      //         children: [
      //           Text("${data.id}"),
      //           Row(
      //             children: [
      //               Expanded(
      //                   child: Text(
      //                       "Place of Death:${data.placeOfDeath}")),
      //               Expanded(child: Text("${data.placeOfDeath}")),
      //             ],
      //           ),
      //           Row(
      //             children: [
      //               Expanded(child: Text("Cause of Death")),
      //               Expanded(child: Text("${data.causeOfDeath}")),
      //             ],
      //           ),
      //         ],
      //       );
      //     });
      //   } else {
      //     CircularProgressIndicator();
      //   }
      //   return Text("Loading");
      // }),
    );
  }
}
