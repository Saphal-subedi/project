// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:dio/dio.dart';
import 'package:e_woda/Kyc%20Update/StateGroup/state_types_model.dart';
import 'package:e_woda/y_urlpage_list.dart';
import 'package:flutter/material.dart';

var selectedStateId;

class StateDropDownButton extends StatefulWidget {
  const StateDropDownButton({super.key});

  @override
  State<StateDropDownButton> createState() => StateDropDownButtonState();
}

class StateDropDownButtonState extends State<StateDropDownButton> {
  Future<List<StateType>> getBlood() async {
    final dio = Dio();

    final res = await dio.get(stategrouplisturl);

    // print("The value in list is-------------------");
    // print(bodyy.map((e) => BloodGroup(id: e.id, value: e.value)).toList());

    List listData = res.data["data"];
    List<StateType> data =
        listData.map((e) => StateType(id: e["id"], value: e["value"])).toList();

    return data;
  }

  var selectedStateValue;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<StateType>>(
        future: getBlood(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return DropdownButton(
                hint: const Text("Select Your State"),
                isExpanded: true,
                value: selectedStateValue,
                items: snapshot.data!.map((e) {
                  return DropdownMenuItem(
                      onTap: () {
                        selectedStateId = e.id;

                        setState(() {});
                      },
                      value: e.value.toString(),
                      child: Text(e.value.toString()));
                }).toList(),
                onChanged: (value) {
                  selectedStateValue = value;
                  setState(() {});
                });
          } else {
            return const CircularProgressIndicator();
          }
        });
  }
}
