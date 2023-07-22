import 'package:e_woda/features/Community%20Engagement/Health/health_page.dart';
import 'package:e_woda/features/Official%20Notices%20and%20Announcements/Notice/notice_page.dart';
import 'package:e_woda/features/Official%20Notices%20and%20Announcements/E%20Sifaris/e_sifaris_page.dart';
import 'package:e_woda/features/Online%20Information/Blog/blog_page.dart';
import 'package:e_woda/features/Online%20Information/News%20Portal/news_portal_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

import '../../Common/custom_title_image.dart';

class OnlineInformation extends StatelessWidget {
  const OnlineInformation({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final applocalization = AppLocalizations.of(context);
    return Padding(
      padding: EdgeInsets.all(15),
      child: Container(
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
                  applocalization!.onlineinformation,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Row(
                children: [
                  Spacer(),
                  GestureDetector(
                    child: CustomTitleImage(
                        image: "assets/images/news portal.png",
                        title: applocalization!.newsportal),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const NewsPortal()));
                    },
                  ),
                  Spacer(),
                  GestureDetector(
                    child: CustomTitleImage(
                        image: "assets/images/blog.png",
                        title: applocalization!.blog),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Blog()));
                    },
                  ),
                  Spacer(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
