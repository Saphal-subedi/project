import 'package:e_woda/Connect/connect_page.dart';
import 'package:e_woda/Department/department_page.dart';
import 'package:e_woda/New%20Home%20Page/top_container.dart';
import 'package:e_woda/Services/services_page.dart';
import 'package:e_woda/Shared%20Preferences/shared_preferences_services.dart';
import 'package:e_woda/New%20Home%20Page/User%20Register%20Page/register_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

import '../New Home Page/Drawer/drawer_page.dart';

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
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
            child: CircleAvatar(
                backgroundColor: Colors.yellow.shade900,
                child: IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterUser()));
                    },
                    icon: Icon(
                      Icons.person,
                      color: Colors.white,
                    ))),
          ),
        ],
        title: Text(AppLocalizations.of(context)!.name),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(color: Colors.blue.shade300),
        ),
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
