import 'package:dio/dio.dart';
import 'package:e_woda/Kyc%20Update/PalicaGroup/palica_types_model.dart';
import 'package:e_woda/y_urlpage_list.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

var selectedPalicaId;

class PalicaDropDownButton extends StatefulWidget {
  const PalicaDropDownButton({super.key});

  @override
  State<PalicaDropDownButton> createState() => PalicaDropDownButtonState();
}

class PalicaDropDownButtonState extends State<PalicaDropDownButton> {
  Future<List<PalicaType>> getBlood() async {
    final dio = Dio();

    final res = await dio.get(palicagrouplisturl);

    // print("The value in list is-------------------");
    // print(bodyy.map((e) => BloodGroup(id: e.id, value: e.value)).toList());

    List listData = res.data["data"];
    Logger().e(listData);
    List<PalicaType> data = listData
        .map((e) => PalicaType(id: e["id"], value: e["value"]))
        .toList();

    return data;
  }

  var selectedPalicaValue;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PalicaType>>(
        future: getBlood(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return DropdownButton(
                hint: Text("Select Your Palica Type"),
                isExpanded: true,
                value: selectedPalicaValue,
                items: snapshot.data!.map((e) {
                  return DropdownMenuItem(
                      onTap: () {
                        selectedPalicaId = e.id;

                        setState(() {});
                      },
                      value: e.value.toString(),
                      child: Text(e.value.toString()));
                }).toList(),
                onChanged: (value) {
                  selectedPalicaValue = value;
                  setState(() {});
                });
          } else {
            return CircularProgressIndicator();
          }
        });
  }
}
