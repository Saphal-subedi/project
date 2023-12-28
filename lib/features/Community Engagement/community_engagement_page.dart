import 'package:e_woda/features/Community%20Engagement/Education/education_page.dart';
import 'package:e_woda/features/Community%20Engagement/Environment/environment.dart';
import 'package:e_woda/features/Community%20Engagement/Health/health_page.dart';
import 'package:e_woda/Common/custom_title_image.dart';
import 'package:e_woda/features/Community%20Engagement/Tourism%20Site/tourism_site_page.dart';

import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localization.dart';

class CommunityEngagement extends StatelessWidget {
  const CommunityEngagement({super.key});

  @override
  Widget build(BuildContext context) {
    // final height = MediaQuery.of(context).size.height;
    // final width = MediaQuery.of(context).size.width;
    final applocalization = AppLocalizations.of(context);
    return Padding(
      padding: const EdgeInsets.all(15),
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
                padding: const EdgeInsets.fromLTRB(20.0, 0, 0, 20),
                child: Text(
                  applocalization!.communityengagement,
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    GestureDetector(
                      child: CustomTitleImage(
                          image: "assets/images/education.png",
                          title: applocalization.education),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Education()));
                      },
                    ),
                    const SizedBox(width: 10.0),
                    GestureDetector(
                      child: CustomTitleImage(
                          image: "assets/images/health.png",
                          title: applocalization.health),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Health()));
                      },
                    ),
                    const SizedBox(width: 10.0),
                    GestureDetector(
                      child: CustomTitleImage(
                          image: "assets/images/environment.png",
                          title: applocalization.environment),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Environment()));
                      },
                    ),
                    const SizedBox(width: 10.0),
                    GestureDetector(
                      child: CustomTitleImage(
                          image: "assets/images/tourism site.png",
                          title: applocalization.tourismSite),
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
