import 'dart:convert';

import 'package:e_woda/Kyc%20Update/BloodGroup/blood_group_model.dart';
import 'package:e_woda/y_urlpage_list.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

var seletedBloodId;

class BloodGroupDropDownButton extends StatefulWidget {
  const BloodGroupDropDownButton({super.key});

  @override
  State<BloodGroupDropDownButton> createState() =>
      BloodGroupDropDownButtonState();
}

class BloodGroupDropDownButtonState extends State<BloodGroupDropDownButton> {
  Future<List<BloodGroup>> getBlood() async {
    final dio = Dio();

    final res = await dio.get(bloodgrouplisturl);

    // print("The value in list is-------------------");
    // print(bodyy.map((e) => BloodGroup(id: e.id, value: e.value)).toList());

    List listData = res.data["data"];
    List<BloodGroup> data = listData
        .map((e) => BloodGroup(id: e["id"], value: e["value"]))
        .toList();

    return data;
  }

  var selectedBloodValue;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<BloodGroup>>(
        future: getBlood(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return DropdownButton(
                hint: Text("Select Your Blood Group"),
                isExpanded: true,
                value: selectedBloodValue,
                items: snapshot.data!.map((e) {
                  return DropdownMenuItem(
                      onTap: () {
                        seletedBloodId = e.id;

                        setState(() {});
                      },
                      value: e.value.toString(),
                      child: Text(e.value.toString()));
                }).toList(),
                onChanged: (value) {
                  selectedBloodValue = value;

                  setState(() {});
                });
          } else {
            return CircularProgressIndicator();
          }
        });
    ;
  }
}
