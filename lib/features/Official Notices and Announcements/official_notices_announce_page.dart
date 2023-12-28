import 'package:e_woda/features/Official%20Notices%20and%20Announcements/Notice/notice_page.dart';
import 'package:e_woda/features/Official%20Notices%20and%20Announcements/E%20Sifaris/e_sifaris_page.dart';
import 'package:e_woda/features/Official%20Notices%20and%20Announcements/Suggestions/suggestion_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

import '../../Common/custom_title_image.dart';

class OfficialNoticeAndAnnouncements extends StatelessWidget {
  const OfficialNoticeAndAnnouncements({super.key});

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
                  applocalization!.officialnoticeandannounement,
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
                          image: "assets/images/Notices.png",
                          title: applocalization.notice),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Notice()));
                      },
                    ),
                    const SizedBox(width: 10.0),
                    GestureDetector(
                      child: CustomTitleImage(
                          image: "assets/images/suggestion.png",
                          title: applocalization.suggestions),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Suggestion()));
                      },
                    ),
                    const SizedBox(width: 10.0),
                    GestureDetector(
                      child: CustomTitleImage(
                          image: "assets/images/e-sifaris.png",
                          title: applocalization.esifarish),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ESifaris()));
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
