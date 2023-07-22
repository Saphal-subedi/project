import 'package:e_woda/features/HomePage/widgets/custom_tile_drawer.dart';
import 'package:e_woda/Shared%20Preferences/shared_preferences_services.dart';
import 'package:e_woda/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class CustomDrawer extends StatefulWidget {
  CustomDrawer({super.key, required this.valb});
  bool? valb;

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  bool switchValue = false;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final applocalization = AppLocalizations.of(context);
    return Drawer(
      child: SafeArea(
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
                        print("ready to display value");
                        print(localizationval);
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
              DrawerContent(
                  title: applocalization!.health,
                  image: "assets/images/health.png"),
              DrawerContent(
                  title: applocalization!.education,
                  image: "assets/images/education.png"),
              DrawerContent(
                  title: applocalization!.helplineNumber,
                  image: "assets/images/helpline-number.png"),
              DrawerContent(
                  title: applocalization!.administration,
                  image: "assets/images/administration.png"),
              DrawerContent(
                  title: applocalization!.tourismSite,
                  image: "assets/images/tourism site.png"),
              DrawerContent(
                  title: applocalization!.newsportal,
                  image: "assets/images/news portal.png"),
              DrawerContent(
                  title: applocalization!.blog,
                  image: "assets/images/blog.png"),
              DrawerContent(
                  title: applocalization!.environment,
                  image: "assets/images/environment.png"),
              DrawerContent(
                  title: applocalization!.notice,
                  image: "assets/images/Notices.png"),
              DrawerContent(
                  title: applocalization!.suggestions,
                  image: "assets/images/suggestion.png"),
              DrawerContent(
                  title: applocalization!.contactMayor,
                  image: "assets/images/contact-mayor.png"),
            ],
          ),
        ),
      ),
    );
  }
}
