import 'package:dio/dio.dart';
import 'package:e_woda/Kyc%20Update/GenderTypes/gender_types_model.dart';
import 'package:e_woda/y_urlpage_list.dart';
import 'package:flutter/material.dart';

var selectedGenderId;
var selectedGenderValue;

class GenderTypeDropDownButton extends StatefulWidget {
  const GenderTypeDropDownButton({super.key});

  @override
  State<GenderTypeDropDownButton> createState() =>
      GenderTypeDropDownButtonState();
}

class GenderTypeDropDownButtonState extends State<GenderTypeDropDownButton> {
  Future<List<GenderType>> getBlood() async {
    final dio = Dio();

    final res = await dio.get(gendergrouplisturl);

    // print("The value in list is-------------------");
    // print(bodyy.map((e) => BloodGroup(id: e.id, value: e.value)).toList());

    List listData = res.data["data"];
    List<GenderType> data = listData
        .map((e) => GenderType(id: e["id"], value: e["value"]))
        .toList();

    return data;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<GenderType>>(
        future: getBlood(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return DropdownButton(
                hint: Text("Select Your Gender Type"),
                isExpanded: true,
                value: selectedGenderValue,
                items: snapshot.data!.map((e) {
                  return DropdownMenuItem(
                      onTap: () {
                        selectedGenderId = e.id;

                        setState(() {});
                      },
                      value: e.value.toString(),
                      child: Text(e.value.toString()));
                }).toList(),
                onChanged: (value) {
                  selectedGenderValue = value;
                  setState(() {});
                });
          } else {
            return CircularProgressIndicator();
          }
        });
  }
}
