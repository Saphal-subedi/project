import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:e_woda/Kyc%20Update/RelationGroup/relation_types_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

var selectedRelationId;

class RelationDropDownButton extends StatefulWidget {
  const RelationDropDownButton({super.key});

  @override
  State<RelationDropDownButton> createState() => _RelationDropDownButtonState();
}

class _RelationDropDownButtonState extends State<RelationDropDownButton> {
  Future<List<RelationType>> getData() async {
    final dio = Dio();

    final res = await dio.get(
        "https://hedgehog-ready-daily.ngrok-free.app/api/app/relation/relation");

    // print("The value in list is-------------------");
    // print(bodyy.map((e) => BloodGroup(id: e.id, value: e.value)).toList());

    List listData = res.data["data"];

    List<RelationType> data = listData
        .map((e) => RelationType(id: e["id"], value: e["value"]))
        .toList();

    return data;
  }

  var selectedrelationvalue;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<RelationType>>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return DropdownButton(
                hint: const Text("Select Your Relation Type"),
                isExpanded: true,
                value: selectedrelationvalue,
                items: snapshot.data!.map((e) {
                  return DropdownMenuItem(
                      onTap: () {
                        selectedRelationId = e.id;

                        setState(() {});
                      },
                      value: e.value.toString(),
                      child: Text(e.value.toString()));
                }).toList(),
                onChanged: (value) {
                  selectedrelationvalue = value;
                  setState(() {});
                });
          } else {
            return const CircularProgressIndicator();
          }
        });
  }
}
