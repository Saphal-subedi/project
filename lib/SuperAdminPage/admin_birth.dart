// ignore_for_file: prefer_const_constructors

import 'dart:convert';

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
  //   Logger().e(items);
  //   return items.map((e) => {
  //     final map=e as Map<String,dynamic>;
  //     return GetBirth(
  //       id:map['id'],
  //       fatherFullName:map['fatherFullName'],
  //       motherFullName:map['motherFullName'],
  //       childFullName:map['childFullName'],
  //     );
  //   }).toList();
  // }

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
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: TotalItem,
                  itemBuilder: (context, index) {
                    final data = snapshot.data![index];

                    return ExpansionTile(
                      title: Text("${data.childFullName}"),
                      children: [
                        Text("${data.id}"),
                        Row(
                          children: [
                            Expanded(child: Text("Father Name:")),
                            Expanded(child: Text("${data.fatherFullName}")),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(child: Text("Mother Name:")),
                            Expanded(child: Text("${data.motherFullName}")),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.check, size: 30)),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.close, size: 30)),
                          ],
                        ),
                      ],
                    );
                  });
            } else {
              CircularProgressIndicator();
            }
            return Text("Loading");
          }),
    );
  }
}
