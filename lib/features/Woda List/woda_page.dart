import 'package:e_woda/HamroServices/birth_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

import '../../core/routes/routes_string.dart';

import '../Services/Birth Registration/birth_registration.dart';
import '../Services/Death Registration/death_registration.dart';
import '../Services/Marrigae Registration/marriage_registration.dart';

import '../Services/custom_container.dart';

class WodaPage extends StatelessWidget {
  const WodaPage({super.key});

  @override
  Widget build(BuildContext context) {
    // final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final applocalization = AppLocalizations.of(context);
    //double padding = width * 0.005;
    return Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Padding(
                padding: EdgeInsets.all(0.04 * width),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.blue.shade50,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20.0, 0, 0, 10),
                        child: Text(
                          applocalization!.services,
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
                              child: CustomImageTitleServices(
                                  index: 0,
                                  title: applocalization!.birthRegistration),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => BirthPage()));
                              },
                            ),
                            const SizedBox(width: 10.0),
                            GestureDetector(
                              child: CustomImageTitleServices(
                                  index: 1,
                                  title: applocalization.marriageRegristration),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const MarriageRegistration()));
                              },
                            ),
                            const SizedBox(width: 10.0),
                            GestureDetector(
                              child: CustomImageTitleServices(
                                  index: 2,
                                  title: applocalization.deathRegristration),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const DeathRegistration()));
                              },
                            ),
                            const SizedBox(width: 10.0),
                            GestureDetector(
                              child: CustomImageTitleServices(
                                  index: 6, title: applocalization.tourismSite),
                              onTap: () {
                                Navigator.pushNamed(
                                    context, RouteString.tourismArea);
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
            ),
          ],
        ));
  }
}

// class WodaPage extends StatelessWidget {
//   const WodaPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final height = MediaQuery.of(context).size.height;
//     final width = MediaQuery.of(context).size.width;
//     return Scaffold(
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(60.0),
//         child: NavigateAppBar(
//             title: AppLocalizations.of(context)!.wodaservicetitle),
//       ),
//       body: 
//     );
//   }
// }
