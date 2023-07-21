<<<<<<< HEAD:lib/Services/services_page.dart
import 'package:e_woda/New%20Home%20Page/Emergency%20Services/Hepline%20Number/helpline_number_page.dart';
import 'package:e_woda/Services/TaxPayment/tax_payment_page.dart';
import 'package:e_woda/Services/more_services.dart';
import 'package:e_woda/Services/services_localization.dart';
import 'package:e_woda/New%20Home%20Page/Woda%20List/woda_page.dart';
=======
import 'package:e_woda/features/Services/Hepline%20Number/helpline_number_page.dart';
import 'package:e_woda/features/Services/TaxPayment/tax_payment_page.dart';
import 'package:e_woda/features/Services/more_services.dart';

>>>>>>> 33199bb4326b88636056f8972d9b98c9865841e9:lib/features/Services/services_page.dart
import 'package:flutter/material.dart';

import 'Birth Registration/birth_registration.dart';
import 'custom_container.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class Services extends StatelessWidget {
  const Services({super.key});

  @override
  Widget build(BuildContext context) {
    // final height = MediaQuery.of(context).size.height;
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
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(0.07 * width, 5, 0, 10),
                      child: Text(
                        applocalization!.services,
                        style: const TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0.07 * width, 10),
                      child: Container(
                          height: 35.0,
                          decoration: BoxDecoration(
                            color: Colors.yellow.shade900,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const WodaPage()));
                              },
                              child: Text(
                                applocalization.viewmore,
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ))),
                    )
                  ],
                ),
                Row(
                  children: [
                    const Spacer(),
                    GestureDetector(
                      onTap: (() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const WodaPage()));
                      }),
                      child: CustomImageTitleServices(
                          index: 0, title: applocalization.birthRegistration),
                    ),
                    const Spacer(),
                    GestureDetector(
                      child: CustomImageTitleServices(
                          index: 3, title: applocalization.taxPayment),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const WodaPage()));
                      },
                    ),
                    const Spacer(),
                    GestureDetector(
                      child: CustomImageTitleServices(
                          index: 4, title: applocalization.helplineNumber),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const WodaPage()));
                      },
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
