import 'package:dio/dio.dart';
import 'package:e_woda/Kyc%20Update/DocumentGroup/document_group_model.dart';
import 'package:e_woda/y_urlpage_list.dart';
import 'package:flutter/material.dart';

var selectedDocumentId;

class DocumentTypeDropDownButton extends StatefulWidget {
  const DocumentTypeDropDownButton({super.key});

  @override
  State<DocumentTypeDropDownButton> createState() =>
      DocumentTypeDropDownButtonState();
}

class DocumentTypeDropDownButtonState
    extends State<DocumentTypeDropDownButton> {
  Future<List<DocumentGroup>> getBlood() async {
    final dio = Dio();

    final res = await dio.get(documentgrouplisturl);

    // print("The value in list is-------------------");
    // print(bodyy.map((e) => BloodGroup(id: e.id, value: e.value)).toList());

    List listData = res.data["data"];
    List<DocumentGroup> data = listData
        .map((e) => DocumentGroup(id: e["id"], value: e["value"]))
        .toList();

    return data;
  }

  var selectedDocumentValue;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<DocumentGroup>>(
        future: getBlood(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return DropdownButton(
                hint: Text("Select Your document type"),
                isExpanded: true,
                value: selectedDocumentValue,
                items: snapshot.data!.map((e) {
                  return DropdownMenuItem(
                      onTap: () {
                        selectedDocumentId = e.id;

                        setState(() {});
                      },
                      value: e.value.toString(),
                      child: Text(e.value.toString()));
                }).toList(),
                onChanged: (value) {
                  selectedDocumentValue = value;
                  setState(() {});
                });
          } else {
            return CircularProgressIndicator();
          }
        });
  }
}
