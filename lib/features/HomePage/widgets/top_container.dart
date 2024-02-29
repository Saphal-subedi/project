// ignore_for_file: unused_import

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:logger/logger.dart';
import 'package:http/http.dart' as http;

import '../../../SuperAdminPage/news_model.dart';

List<GetNews>? allnews;

class TopContainer extends StatefulWidget {
  const TopContainer({super.key});

  @override
  State<TopContainer> createState() => _TopContainerState();
}

class _TopContainerState extends State<TopContainer> {
  Future<void> getNews() async {
    final response = await http.get(Uri.parse(
        "https://hedgehog-ready-daily.ngrok-free.app/api/app/information"));
    final res = jsonDecode(response.body);

    List listData = res["data"];

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
    allnews = data;
  }

  void initState() {
    Logger().e("Init state is called");
    getNews().whenComplete(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    // DateTimeModel dateTimeModel =
    //  Provider.of<DateTimeModel>(context, listen: false);
    if (allnews != null)
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        child: CarouselSlider(
          options: CarouselOptions(height: height * 0.2),
          items: allnews!.map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Color(0xFF39415D),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Title:-  ${i.title}",
                            style: const TextStyle(
                                fontSize: 10.0, color: Color(0xFFF4F5FC)),
                          ),
                          Text(
                            "${i.description}",
                            style: const TextStyle(
                              color: Color(0xFFF4F5FC),
                              fontSize: 9,
                            ),
                          )
                        ],
                      ),
                    ));
              },
            );
          }).toList(),
        ),
      );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: CarouselSlider(
        options: CarouselOptions(height: height * 0.2),
        items: [1].map((i) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Colors.blue.shade300,
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Title:- No News Available}",
                        style: TextStyle(fontSize: 20.0, color: Colors.white),
                      ),
                      Text(
                        "Sorry we dont have any news",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ));
            },
          );
        }).toList(),
      ),
    );
  }
}
