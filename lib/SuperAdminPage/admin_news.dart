// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:e_woda/Common/custom_textformfield.dart';
import 'package:e_woda/SuperAdminPage/news_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class AdminNews extends StatefulWidget {
  const AdminNews({super.key});

  @override
  State<AdminNews> createState() => _AdminNewsState();
}

class _AdminNewsState extends State<AdminNews> {
  Future<void> postNews() async {
    final response = await http.post(
        Uri.parse(
            "https://hedgehog-ready-daily.ngrok-free.app/api/app/information"),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Accept': '*/*',
        },
        body: jsonEncode(<String, dynamic>{
          "title": titleController.text,
          "description": descreptionController.text
        }));
  }

  Future<List<GetNews>> getNews() async {
    Logger().e("Get news function is called");
    final response = await http.get(Uri.parse(
        "https://hedgehog-ready-daily.ngrok-free.app/api/app/information"));
    final res = jsonDecode(response.body);

    List listData = res["data"];
    Logger().e(listData);
    List<GetNews> data = listData
        .map((e) => GetNews(
              title: e["title"],
              description: e["description"],
              isDeleted: e["isDeleted"],
              deleterId: e["deleterId"],
              lastModificationTime: e["lastModificationTime"],
              lastModifierId: e["lastModifierId"],
              creationTime: e["creationTime"],
              creatorId: e["creatorId"],
              id: e["id"],
            ))
        .toList();
    Logger().e("I am at ending point");
    Logger().e(data);

    return data;
  }

  Future<void> deleteNews(String id) async {
    Logger().e("Delete News Called");
    Logger().e("Your Id is $id");
    final response = await http.delete(
      Uri.parse(
          'https://hedgehog-ready-daily.ngrok-free.app/api/app/information/$id'),
    );
    setState(() {});
    Logger().e("Deleted User=${response.body}");
  }

  final titleController = TextEditingController();
  final descreptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Notice",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue.shade300,
      ),
      body: FutureBuilder<List<GetNews>>(
          future: getNews(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    final data = snapshot.data![index];

                    return ExpansionTile(
                      title: Text("${data.title}"),
                      children: [
                        Text("${data.id}"),
                        Row(
                          children: [
                            Expanded(child: Text("Description:")),
                            Expanded(child: Text("${data.description}")),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(child: Text("Id")),
                            Expanded(child: Text("${data.id}")),
                          ],
                        ),
                        IconButton(
                            onPressed: () {
                              deleteNews(data.id.toString());
                            },
                            icon: Icon(
                              Icons.delete,
                              size: 50,
                              color: Colors.red,
                            )),
                      ],
                    );
                  });
            } else {
              CircularProgressIndicator();
            }
            return Text("Loading");
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  content: Container(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        CustomTextFormField(
                            hintText: "Title", textController: titleController),
                        SizedBox(height: 30.0),
                        TextField(
                          decoration:
                              InputDecoration(hintText: "Describe news here"),
                          maxLines: 3,
                          controller: descreptionController,
                        ),
                        TextButton(
                          onPressed: () {
                            postNews().whenComplete(() {
                              Navigator.pop(context);
                              titleController.clear();
                              descreptionController.clear();
                            });
                          },
                          child: Text("Add"),
                        ),
                      ],
                    ),
                  ),
                );
              });
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blue.shade300,
      ),
    );
  }
}
//  void _showModalBottomSheet(BuildContext context) {
   
//   }
// }
