// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

import 'model.dart';

class CustomDropDown extends StatefulWidget {
  const CustomDropDown({super.key});

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  Future<List<Model>> getData() async {
    final response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    final body = jsonDecode(response.body) as List;
    Logger().e("Hello I am callledddkjlafajfj-----");

    return body.map((e) {
      final map = e as Map<String, dynamic>;
      return Model(
        userId: map['userId'],
        id: map['id'],
        title: map['title'],
        body: map['body'],
      );
    }).toList();
  }

  var selectedvalue;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Model>>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return DropdownButton(
                hint: const Text("Select Your Blood Group"),
                isExpanded: true,
                value: selectedvalue,
                items: snapshot.data!.map((e) {
                  return DropdownMenuItem(
                      value: e.id.toString(), child: Text(e.id.toString()));
                }).toList(),
                onChanged: (value) {
                  selectedvalue = value;
                  setState(() {});
                });
          } else {
            return const CircularProgressIndicator();
          }
        });
  }
}
