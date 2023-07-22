import 'package:e_woda/features/Administrative%20Solutions/ContactMayor/contact_mayor.dart';
import 'package:e_woda/features/Administrative%20Solutions/Queries/queries_page.dart';
import 'package:e_woda/features/Administrative%20Solutions/Administration/administration.dart';
import 'package:e_woda/features/Community%20Engagement/Education/education_page.dart';
import 'package:e_woda/features/Community%20Engagement/Environment/environment.dart';
import 'package:e_woda/features/Administrative%20Solutions/Financial%20services/financial_services_page.dart';
import 'package:e_woda/features/Community%20Engagement/Health/health_page.dart';
import 'package:e_woda/features/Administrative%20Solutions/LawAndHumanRights/law_and_human_page.dart';
import 'package:e_woda/Common/custom_title_image.dart';
import 'package:e_woda/features/Community%20Engagement/Tourism%20Site/tourism_site_page.dart';

import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localization.dart';

class CommunityEngagement extends StatelessWidget {
  const CommunityEngagement({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final applocalization = AppLocalizations.of(context);
    return Padding(
      padding: EdgeInsets.all(15),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.blue.shade50,
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(20.0, 0, 0, 20),
                child: Text(
                  applocalization!.communityengagement,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SizedBox(width: 20.0),
                    GestureDetector(
                      child: CustomTitleImage(
                          image: "assets/images/education.png",
                          title: applocalization!.education),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Education()));
                      },
                    ),
                    SizedBox(width: 20.0),
                    GestureDetector(
                      child: CustomTitleImage(
                          image: "assets/images/health.png",
                          title: applocalization!.health),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Health()));
                      },
                    ),
                    SizedBox(width: 20.0),
                    GestureDetector(
                      child: CustomTitleImage(
                          image: "assets/images/environment.png",
                          title: applocalization!.environment),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Environment()));
                      },
                    ),
                    SizedBox(width: 20.0),
                    GestureDetector(
                      child: CustomTitleImage(
                          image: "assets/images/tourism site.png",
                          title: applocalization!.tourismSite),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const TourismSite()));
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
