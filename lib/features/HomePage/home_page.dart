import 'package:e_woda/features/Administrative%20Solutions/custom_container_administrativeSolutions.dart_page.dart';
import 'package:e_woda/features/Community%20Engagement/community_engagement_page.dart';
import 'package:e_woda/features/Emergency%20Services/emergency_services.dart';
import 'package:e_woda/features/HomePage/widgets/drawer_page.dart';
import 'package:e_woda/features/HomePage/widgets/top_container.dart';
import 'package:e_woda/features/Woda%20List/woda_page.dart';

import 'package:e_woda/Shared%20Preferences/shared_preferences_services.dart';
import 'package:e_woda/features/authentication/User%20Login%20Page/login_user_page.dart';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

import '../Interactive Services/interactive_services_page.dart';
import '../Official Notices and Announcements/official_notices_announce_page.dart';
import '../Online Information/online_information_page.dart';
import '../authentication/User Register Page/register_user.dart';

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
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginUser()));
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
