import 'package:e_woda/Connect/connect_page.dart';
import 'package:e_woda/Department/department_page.dart';
import 'package:e_woda/New%20Home%20Page/Administrative%20Solutions/custom_container_administrativeSolutions.dart_page.dart';
import 'package:e_woda/New%20Home%20Page/Community%20Engagement/community_engagement_page.dart';
import 'package:e_woda/New%20Home%20Page/Emergency%20Services/emergency_services.dart';
import 'package:e_woda/New%20Home%20Page/Woda%20List/woda_page.dart';
import 'package:e_woda/New%20Home%20Page/top_container.dart';
import 'package:e_woda/Services/services_page.dart';
import 'package:e_woda/Shared%20Preferences/shared_preferences_services.dart';
import 'package:e_woda/New%20Home%20Page/User%20Register%20Page/register_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

import 'Interactive Services/interactive_services_page.dart';
import 'Official Notices and Announcements/official_notices_announce_page.dart';
import 'Online Information/online_information_page.dart';
import 'Drawer/drawer_page.dart';

class NewHomePage extends StatefulWidget {
  const NewHomePage({super.key});

  @override
  State<NewHomePage> createState() => _NewHomePageState();
}

class _NewHomePageState extends State<NewHomePage> {
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
                backgroundColor: Colors.orange.shade50,
                child: IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterUser()));
                    },
                    icon: Icon(
                      Icons.person,
                      color: Colors.black,
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
              AdministrativeSolutions(),
              CommunityEngagement(),
              WodaPage(),
              OfficialNoticeAndAnnouncements(),
              EmergencyServices(),
              OnlineInformation(),
              InteractiveServices(),
            ],
          ),
        ),
      ),
      drawer: CustomDrawer(valb: valb),
    );
  }
}
