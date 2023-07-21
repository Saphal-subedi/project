import 'package:e_woda/New%20Home%20Page/Administrative%20Solutions/Queries/queries_page.dart';
import 'package:e_woda/Connect/Suggestion/suggestion_page.dart';

import 'package:flutter/material.dart';

import '../New Home Page/Administrative Solutions/ContactMayor/contact_mayor.dart';
import 'custom_container.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class Connect extends StatelessWidget {
  const Connect({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final applocalization = AppLocalizations.of(context);
    return Padding(
      padding: EdgeInsets.all(0.02 * width),
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
                  padding: EdgeInsets.fromLTRB(0.07 * width, 0, 0, 10),
                  child: Text(
                    "",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Row(
                  children: [
                    const Spacer(),
                    GestureDetector(
                      child: CustomImageTitleConnect(
                          index: 0, title: applocalization!.contactMayor),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ContactMayor()));
                      },
                    ),
                    const Spacer(),
                    GestureDetector(
                      child: CustomImageTitleConnect(
                          index: 1, title: applocalization!.suggestions),
                      onTap: (() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Suggestions()));
                      }),
                    ),
                    const Spacer(),
                    GestureDetector(
                      child: CustomImageTitleConnect(
                          index: 2, title: applocalization!.queries),
                      onTap: (() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Queries()));
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
