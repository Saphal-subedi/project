import 'package:e_woda/features/Connect/connect_page.dart';
import 'package:e_woda/features/Department/department_page.dart';
import 'package:e_woda/features/HomePage/widgets/top_container.dart';
import 'package:e_woda/features/Services/services_page.dart';
import 'package:e_woda/Shared%20Preferences/shared_preferences_services.dart';
import 'package:e_woda/features/authentication/User%20Register%20Page/register_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

import 'widgets/drawer_page.dart';

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
    //  final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
            child: CircleAvatar(
                backgroundColor: Colors.orange,
                child: IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterUser()));
                    },
                    icon: const Icon(Icons.person))),
          ),
        ],
        title: Text(AppLocalizations.of(context)!.name),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(color: Colors.blue.shade300),
        ),
      ),
      body: const SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TopContainer(),
              Department(),
              Connect(),
              Services(),
            ],
          ),
        ),
      ),
      drawer: CustomDrawer(valb: valb),
    );
  }
}
