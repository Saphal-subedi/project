// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import 'get_user_model.dart';
import 'package:http/http.dart' as http;

class AdminUserInfo extends StatelessWidget {
  var TotalItem;
  final getuserdetailsurl =
      "https://hedgehog-ready-daily.ngrok-free.app/api/app/user-management/paged-and-sorted-list";
  Future<List<GetUserDetails>> getBirth() async {
    final response = await http.get(Uri.parse(getuserdetailsurl));
    final body = jsonDecode(response.body);

    List items = body['data']['items'];
    TotalItem = body['data']['totalCount'];
    List<GetUserDetails> data =
        items.map((e) => GetUserDetails.fromJson(e)).toList();

    Logger().e(data);

    return data;
  }

  AdminUserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "UserInfo",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue.shade300,
      ),
      body: FutureBuilder<List<GetUserDetails>>(
          future: getBirth(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: TotalItem,
                  itemBuilder: (context, index) {
                    final data = snapshot.data![index];

                    return ExpansionTile(
                      title: Text("MemberName:-${data.memberName}"),
                      children: [
                        Text("${data.id}"),
                        Row(
                          children: [
                            Expanded(child: Text("Role:")),
                            Expanded(child: Text("${data.role}")),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(child: Text("MemberEmail:")),
                            Expanded(child: Text("${data.memberEmail}")),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(child: Text("Username:")),
                            Expanded(child: Text("${data.userName}")),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(child: Text("Phone Number:")),
                            Expanded(child: Text("${data.phoneNumber}")),
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
