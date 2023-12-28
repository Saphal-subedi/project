// ignore_for_file: use_build_context_synchronously

import 'package:e_woda/features/HomePage/widgets/custom_tile_drawer.dart';
import 'package:e_woda/Shared%20Preferences/shared_preferences_services.dart';
import 'package:e_woda/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

import '../../../core/routes/routes_string.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key, required this.valb});
  final bool? valb;

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  bool switchValue = false;

  @override
  Widget build(BuildContext context) {
    //final height = MediaQuery.of(context).size.height;
    final applocalization = AppLocalizations.of(context);
    return Drawer(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    const Text("English"),
                    Switch.adaptive(
                        value: localizationval ?? false,
                        onChanged: ((value) async {
                          SharedPreferenceService.setdata(value);

                          localizationval =
                              await SharedPreferenceService().getdata();

                          setState(() {});
                          if (localizationval == true) {
                            MyApp.setlocal(context, const Locale("no"));
                            setState(() {});
                          } else {
                            MyApp.setlocal(context, const Locale("en"));
                            setState(() {});
                          }
                        })),
                    const Text("नेपाली"),
                  ],
                ),
                GestureDetector(
                  child: DrawerContent(
                      title: applocalization!.health,
                      image: "assets/images/health.png"),
                  onTap: () {
                    Navigator.pushNamed(context, RouteString.health);
                  },
                ),
                GestureDetector(
                  child: DrawerContent(
                      title: applocalization.education,
                      image: "assets/images/education.png"),
                  onTap: () {
                    Navigator.pushNamed(context, RouteString.education);
                  },
                ),
                GestureDetector(
                  child: DrawerContent(
                      title: applocalization.helplineNumber,
                      image: "assets/images/helpline-number.png"),
                  onTap: () {
                    Navigator.pushNamed(context, RouteString.helplineNumber);
                  },
                ),
                GestureDetector(
                  child: DrawerContent(
                      title: applocalization.ambulance,
                      image: "assets/images/ambulance.png"),
                  onTap: () {
                    Navigator.pushNamed(context, RouteString.ambulance);
                  },
                ),
                GestureDetector(
                  child: DrawerContent(
                      title: applocalization.police,
                      image: "assets/images/police.png"),
                  onTap: () {
                    Navigator.pushNamed(context, RouteString.police);
                  },
                ),
                GestureDetector(
                  child: DrawerContent(
                      title: applocalization.administration,
                      image: "assets/images/administration.png"),
                  onTap: () {
                    Navigator.pushNamed(context, RouteString.administration);
                  },
                ),
                GestureDetector(
                  child: DrawerContent(
                      title: applocalization.tourismSite,
                      image: "assets/images/tourism site.png"),
                  onTap: () {
                    Navigator.pushNamed(context, RouteString.tourismArea);
                  },
                ),
                GestureDetector(
                  child: DrawerContent(
                      title: applocalization.newsportal,
                      image: "assets/images/news portal.png"),
                  onTap: () {
                    Navigator.pushNamed(context, RouteString.newsPortal);
                  },
                ),
                GestureDetector(
                  child: DrawerContent(
                      title: applocalization.blog,
                      image: "assets/images/blog.png"),
                  onTap: () {
                    Navigator.pushNamed(context, RouteString.blog);
                  },
                ),
                GestureDetector(
                  child: DrawerContent(
                      title: applocalization.environment,
                      image: "assets/images/environment.png"),
                  onTap: () {
                    Navigator.pushNamed(context, RouteString.environment);
                  },
                ),
                GestureDetector(
                  child: DrawerContent(
                      title: applocalization.notice,
                      image: "assets/images/Notices.png"),
                  onTap: () {
                    Navigator.pushNamed(context, RouteString.notice);
                  },
                ),
                GestureDetector(
                  child: DrawerContent(
                      title: applocalization.suggestions,
                      image: "assets/images/suggestion.png"),
                  onTap: () {
                    Navigator.pushNamed(context, RouteString.suggestions);
                  },
                ),
                GestureDetector(
                  child: DrawerContent(
                      title: applocalization.contactMayor,
                      image: "assets/images/contact-mayor.png"),
                  onTap: () {
                    Navigator.pushNamed(context, RouteString.contactMayor);
                  },
                ),
                GestureDetector(
                  child: DrawerContent(
                      title: applocalization.nagarpatro,
                      image: "assets/images/nagarpatro.png"),
                  onTap: () {
                    Navigator.pushNamed(context, RouteString.nagarCalendar);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
