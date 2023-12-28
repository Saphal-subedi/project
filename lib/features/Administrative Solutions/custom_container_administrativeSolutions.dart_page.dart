import 'package:e_woda/features/Administrative%20Solutions/ContactMayor/contact_mayor.dart';
import 'package:e_woda/features/Administrative%20Solutions/Nagar%20Patro/nagar_calendar.dart';
import 'package:e_woda/features/Administrative%20Solutions/Queries/queries_page.dart';
import 'package:e_woda/features/Administrative%20Solutions/Administration/administration.dart';
import 'package:e_woda/features/Administrative%20Solutions/Financial%20services/financial_services_page.dart';
import 'package:e_woda/features/Administrative%20Solutions/LawAndHumanRights/law_and_human_page.dart';
import 'package:e_woda/Common/custom_title_image.dart';

import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localization.dart';

class AdministrativeSolutions extends StatelessWidget {
  const AdministrativeSolutions({super.key});

  @override
  Widget build(BuildContext context) {
    // final height = MediaQuery.of(context).size.height;
    // final width = MediaQuery.of(context).size.width;
    final applocalization = AppLocalizations.of(context);
    return Padding(
      padding: const EdgeInsets.all(15.0),
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
                padding: const EdgeInsets.fromLTRB(20.0, 0, 0, 10),
                child: Text(
                  applocalization!.administratrativesolutions,
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
                          image: "assets/images/administration.png",
                          title: applocalization.administration),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Administration()));
                      },
                    ),
                    const SizedBox(width: 10.0),
                    GestureDetector(
                      child: CustomTitleImage(
                          image: "assets/images/financial.png",
                          title: applocalization.financialService),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const FinancialServices()));
                      },
                    ),
                    const SizedBox(width: 10.0),
                    GestureDetector(
                      child: CustomTitleImage(
                          image: "assets/images/contact-mayor.png",
                          title: applocalization.contactMayor),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ContactMayor()));
                      },
                    ),
                    const SizedBox(width: 10.0),
                    GestureDetector(
                      child: CustomTitleImage(
                          image: "assets/images/queries.png",
                          title: applocalization.queries),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Queries()));
                      },
                    ),
                    const SizedBox(width: 10.0),
                    GestureDetector(
                      child: CustomTitleImage(
                          image: "assets/images/nagarpatro.png",
                          title: applocalization.nagarpatro),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const NagarCalendar()));
                      },
                    ),
                    const SizedBox(width: 10.0),
                    GestureDetector(
                      child: CustomTitleImage(
                          image: "assets/images/laws and human rights.png",
                          title: applocalization.laws),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const LawAndHumanRights()));
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
