import 'package:e_woda/features/Services/Death%20Registration/death_registration.dart';

import 'package:e_woda/features/Services/Marrigae%20Registration/marriage_registration.dart';
import 'package:e_woda/features/Services/Public%20Forum/public_forum_page.dart';

import 'package:e_woda/features/Services/Ward%20Info/ward_info_page.dart';
import 'package:e_woda/features/Services/custom_container.dart';
import 'package:flutter/material.dart';

import '../../core/routes/routes_string.dart';

import 'Birth Registration/birth_registration.dart';
import 'TaxPayment/tax_payment_page.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class MoreServices extends StatelessWidget {
  const MoreServices({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final applocalization = AppLocalizations.of(context);
    return Padding(
      padding: EdgeInsets.all(0.04 * width),
      child: Container(
        height: height * 0.6,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.blue.shade50,
        ),
        child: Column(
          children: [
            Row(
              children: [
                GestureDetector(
                  child: CustomImageTitleServices(
                      index: 0, title: applocalization!.birthRegistration),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const BirthRegistration()));
                  },
                ),
                const Spacer(),
                GestureDetector(
                  child: CustomImageTitleServices(
                      index: 1, title: applocalization.marriageRegristration),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const MarriageRegistration()));
                  },
                ),
                const Spacer(),
                GestureDetector(
                  child: CustomImageTitleServices(
                      index: 2, title: applocalization.deathRegristration),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DeathRegistration()));
                  },
                ),
                const Spacer(),
              ],
            ),
            Row(
              children: [
                GestureDetector(
                  child: CustomImageTitleServices(
                      index: 3, title: applocalization.taxPayment),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TaxPayment()));
                  },
                ),
                const Spacer(),
                GestureDetector(
                  child: CustomImageTitleServices(
                      index: 4, title: applocalization.helplineNumber),
                  onTap: () {
                    Navigator.pushNamed(context, RouteString.helplineNumber);
                  },
                ),
                const Spacer(),
                GestureDetector(
                  child: CustomImageTitleServices(
                      index: 5, title: applocalization.wardInfo),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const WardInfo()));
                  },
                ),
                const Spacer(),
              ],
            ),
            Row(
              children: [
                GestureDetector(
                  child: CustomImageTitleServices(
                      index: 6, title: applocalization.tourismSite),
                  onTap: () {
                    Navigator.pushNamed(context, RouteString.tourismArea);
                  },
                ),
                const Spacer(),
                GestureDetector(
                  child: CustomImageTitleServices(
                      index: 7, title: applocalization.esifarish),
                  onTap: () {
                    Navigator.pushNamed(context, RouteString.eSifaris);
                  },
                ),
                const Spacer(),
                GestureDetector(
                  child: CustomImageTitleServices(
                      index: 8, title: applocalization.publicforum),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PublicForum()));
                  },
                ),
                const Spacer(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
