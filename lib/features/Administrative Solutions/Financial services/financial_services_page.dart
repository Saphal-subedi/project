// ignore_for_file: prefer_const_constructors

import 'package:e_woda/Common/custom_appbar.dart';
import 'package:e_woda/Common/unordered_list.dart';
import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localization.dart';

class FinancialServices extends StatelessWidget {
  const FinancialServices({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(60.0),
            child: NavigateAppBar(
                title: AppLocalizations.of(context)!.financialService)),
        body: SingleChildScrollView(
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              UnorderedListItem(
                  itemText:
                      "बजेट को जानकारी: नगरपालिकाको बजेट विनियोजन, वित्तीय प्रतिवेदन, र वित्तीय पारदर्शिता प्रवर्द्धन गर्न खर्च विवरणहरूमा नागरिक हरुको पहुँच।"),
              UnorderedListItem(
                  itemText:
                      "अनलाइन भुक्तानीहरू: थप सुविधाको लागि नागरिकहरूलाई एप मार्फत सेवाहरू, करहरू र जरिवानाहरू इलेक्ट्रोनिक रूपमा भुक्तानी गर्न अनुमति दिन सकीनेछ।"),
              UnorderedListItem(
                  itemText:
                      "अनुदान र कोष: सामुदायिक परियोजनाहरू र पहलहरूलाई समर्थन गर्न उपलब्ध अनुदानहरू, कोषका अवसरहरू, र योग्यता मापदण्डहरू बारे जानकारी प्रदान गर्न  सकीनेछ।"),
              UnorderedListItem(
                  itemText:
                      "कर सम्बंधी जानकारी: सम्पत्ति करहरू, कर निर्धारण विवरणहरू हेर्न, र समयमै कर-सम्बन्धित अद्यावधिकहरू प्रदान गर्न  सकीनेछ।"),
              UnorderedListItem(
                  itemText:
                      "आय र व्यय ट्र्याकिङ: वित्तीय जवाफदेहिता सुनिश्चित गर्न नगरपालिकाको आय र व्यय ट्र्याक गर्न नागरिकहरूलाई प्लेटफर्म प्रदान गर्न  सकीनेछ।"),
            ],
          ),
        ));
  }
}
