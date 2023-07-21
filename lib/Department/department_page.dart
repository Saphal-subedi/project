import 'package:e_woda/New%20Home%20Page/Administrative%20Solutions/Administration/administration.dart';
import 'package:e_woda/New%20Home%20Page/Community%20Engagement/Education/education_page.dart';
import 'package:e_woda/New%20Home%20Page/Community%20Engagement/Environment/environment.dart';
import 'package:e_woda/New%20Home%20Page/Administrative%20Solutions/Financial%20services/financial_services_page.dart';
import 'package:e_woda/New%20Home%20Page/Administrative%20Solutions/LawAndHumanRights/law_and_human_page.dart';
import 'package:e_woda/New%20Home%20Page/Official%20Notices%20and%20Announcements/Notice/notice_page.dart';
import 'package:e_woda/Department/Urban%20Management/urban_management.dart';
import 'package:e_woda/Department/custom_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

import '../New Home Page/Community Engagement/Health/health_page.dart';

class Department extends StatelessWidget {
  const Department({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final applocalization = AppLocalizations.of(context);
    return Padding(
      padding: EdgeInsets.all(0.018 * width),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.blue.shade50,
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(0.06 * width, 0, 0, 10),
                  child: Text(
                    applocalization!.administratrativesolutions,
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Row(
                  children: [
                    const Spacer(),
                    GestureDetector(
                      child: CustomImageTitle(
                          index: 0, title: applocalization!.administration),
                      onTap: (() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Administration()));
                      }),
                    ),
                    const Spacer(),
                    GestureDetector(
                      child: CustomImageTitle(
                          index: 2, title: applocalization!.health),
                      onTap: (() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Health()));
                      }),
                    ),
                    const Spacer(),
                    GestureDetector(
                      child: Stack(
                        children: [
                          CustomImageTitle(
                              index: 3, title: applocalization!.notice),
                          const Positioned(
                            right: 0,
                            child: CircleAvatar(
                              backgroundColor: Colors.red,
                              radius: 5,
                            ),
                          ),
                        ],
                      ),
                      onTap: (() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Notice()));
                      }),
                    ),
                    const Spacer(),
                    GestureDetector(
                      child: CustomImageTitle(
                          index: 4, title: applocalization!.financialService),
                      onTap: (() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const FinancialServices()));
                      }),
                    ),
                    const Spacer(),
                  ],
                ),
                const SizedBox(height: 20.0),
                Row(
                  children: [
                    const Spacer(),
                    GestureDetector(
                      child: CustomImageTitle(
                          index: 1, title: applocalization!.education),
                      onTap: (() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Education()));
                      }),
                    ),
                    const Spacer(),
                    GestureDetector(
                      child: CustomImageTitle(
                          index: 5, title: applocalization!.environment),
                      onTap: (() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Environment()));
                      }),
                    ),
                    const Spacer(),
                    GestureDetector(
                      child: CustomImageTitle(
                          index: 6, title: applocalization!.urbanManagement),
                      onTap: (() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const UrbanManagement()));
                      }),
                    ),
                    const Spacer(),
                    GestureDetector(
                      child: CustomImageTitle(
                          index: 7, title: applocalization!.laws),
                      onTap: (() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const LawAndHumanRights()));
                      }),
                    ),
                    const Spacer(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
