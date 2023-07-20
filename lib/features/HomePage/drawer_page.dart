import 'package:e_woda/Shared%20Preferences/shared_preferences_services.dart';
import 'package:e_woda/main.dart';
import 'package:flutter/material.dart';

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
    return Drawer(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  const Text("en"),
                  Switch.adaptive(
                      value: localizationval ?? false,
                      onChanged: ((value) async {
                        SharedPreferenceService.setdata(value);

                        localizationval =
                            await SharedPreferenceService().getdata();

                        setState(() {});
                        if (localizationval == true) {
                          // ignore: use_build_context_synchronously
                          MyApp.setlocal(context, const Locale("no"));
                          setState(() {});
                        } else {
                          // ignore: use_build_context_synchronously
                          MyApp.setlocal(context, const Locale("en"));
                          setState(() {});
                        }
                      })),
                  const Text("np"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
