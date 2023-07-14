import 'package:e_woda/Connect/connect_page.dart';
import 'package:e_woda/Department/department_page.dart';
import 'package:e_woda/HomePage/top_container.dart';
import 'package:e_woda/Services/services_page.dart';
import 'package:e_woda/Shared%20Preferences/shared_preferences_services.dart';
import 'package:flutter/material.dart';

import 'drawer_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool? valb;
  void initstate() {
    getdata();
    super.initState();
  }

  void getdata() async {
    valb = await SharedPreferenceService().getdata();
  }

  @override
  Widget build(BuildContext context) {
    print(valb);
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar:

          //PreferredSize(
          //  child: CustomAppBar(), preferredSize: Size.fromHeight(0.2 * height)),

          AppBar(
        elevation: 0.0,
        backgroundColor: const Color(0xFF66D47E),
        actions: [
          const Spacer(),
          CircleAvatar(
            backgroundColor: Colors.green,
            radius: 20,
            child: Image.asset(
              "assets/images/ward info.png",
              fit: BoxFit.fitHeight,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const TopContainer(),
              const Department(),
              const Connect(),
              const Services(),
            ],
          ),
        ),
      ),
      drawer: CustomDrawer(valb: valb),
    );
  }
}
