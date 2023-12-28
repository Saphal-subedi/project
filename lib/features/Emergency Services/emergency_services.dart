import 'package:e_woda/features/Emergency%20Services/Ambulance/ambulance_page.dart';
import 'package:e_woda/features/Emergency%20Services/Hepline%20Number/helpline_number_page.dart';
import 'package:e_woda/features/Emergency%20Services/Police/police_page.dart';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

import '../../Common/custom_title_image.dart';

class EmergencyServices extends StatelessWidget {
  const EmergencyServices({super.key});

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
                  applocalization!.emergencyservices,
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
                          image: "assets/images/helpline-number.png",
                          title: applocalization.helplineNumber),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HelplineNumber()));
                      },
                    ),
                    const SizedBox(width: 10.0),
                    GestureDetector(
                      child: CustomTitleImage(
                          image: "assets/images/ambulance.png",
                          title: applocalization.ambulance),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Ambulance()));
                      },
                    ),
                    const SizedBox(width: 10.0),
                    GestureDetector(
                      child: CustomTitleImage(
                          image: "assets/images/police.png",
                          title: applocalization.police),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Police()));
                      },
                    ),
                    const SizedBox(width: 10.0),
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
