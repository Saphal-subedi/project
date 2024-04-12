// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:e_woda/SuperAdminPage/Search_By_BloodGroup.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import 'get_user_model.dart';
import 'package:http/http.dart' as http;

String? saphal = "";

class AdminUserInfo extends StatefulWidget {
  AdminUserInfo({super.key});

  @override
  State<AdminUserInfo> createState() => _AdminUserInfoState();
}

class _AdminUserInfoState extends State<AdminUserInfo> {
  var TotalItem;
  String selectedBloodValue = 'AB_NEGATIVE';

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

  // Future<void> searchByBlood() async {
  //   String blood = saphal ?? "";
  //   var urll =
  //       "https://hedgehog-ready-daily.ngrok-free.app/api/app/user-management/paged-and-sorted-list?BloodGroup=$blood";
  //   bool searchSuccess = false;
  //   final response = await http.post(
  //     Uri.parse(urll),
  //     headers: <String, String>{
  //       'Content-Type': 'application/json',
  //       'Accept': '/',
  //     },
  //   );
  //   response.body;
  //   searchSuccess = true;
  // }
  Future<List<GetUserDetailss>> searchByBlood() async {
    String blood = saphal ?? "";
    var url =
        "https://hedgehog-ready-daily.ngrok-free.app/api/app/user-management/paged-and-sorted-list?BloodGroup=$blood";

    bool searchSuccess = false;

    final response = await http.get(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Accept': '/',
      },
    );

    final body = jsonDecode(response.body);
    List items = body['data']['items'];
    TotalItem = body['data']['totalCount'];
    List<GetUserDetailss> data =
        items.map((e) => GetUserDetailss.fromJson(e)).toList();

    return data;
  }

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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              "Search User By Blood Group",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 0, 0, 10),
            child: Row(
              children: [
                SizedBox(
                  child: BloodButton(
                    selectedBloodValue: selectedBloodValue,
                    onChanged: (value) {
                      setState(() {
                        selectedBloodValue = value!;
                        saphal = selectedBloodValue;
                      });
                    },
                  ),
                ),
                Spacer(),
                GestureDetector(
                  onTap: () async {
                    List<GetUserDetailss> all = await searchByBlood();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BloodSearch(userDetailsList: all),
                      ),
                    );
                  },
                  child: Center(
                    child: Row(
                      children: [
                        Text("Search"),
                        SizedBox(width: 10.0),
                        Icon(Icons.search),
                      ],
                    ),
                  ),
                ),
                Spacer(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              "List of Registered user",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(),
          Expanded(
            child: FutureBuilder<List<GetUserDetails>>(
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
                              Row(
                                children: [
                                  Expanded(child: Text("BloodGroup:")),
                                  Expanded(child: Text("${data.bloodGroup}")),
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
          ),
        ],
      ),
    );
  }
}

class BloodButton extends StatefulWidget {
  final String selectedBloodValue;
  final ValueChanged<String?> onChanged;

  BloodButton({
    required this.selectedBloodValue,
    required this.onChanged,
  });

  @override
  _BloodButtonState createState() => _BloodButtonState();
}

class _BloodButtonState extends State<BloodButton> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
        value: widget.selectedBloodValue,
        items: <String>[
          "AB_NEGATIVE",
          "AB_POSITIVE",
          "A_NEGATIVE",
          "A_POSITIVE",
          "B_NEGATIVE",
          "B_POSITIVE",
          "O_NEGATIVE",
          "O_POSITIVE"
        ].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: widget.onChanged);
  }
}
