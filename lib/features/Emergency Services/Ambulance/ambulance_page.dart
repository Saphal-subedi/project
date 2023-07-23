import 'package:e_woda/Common/unordered_list.dart';
import 'package:flutter/material.dart';

import '../../../Common/custom_appbar.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class Ambulance extends StatelessWidget {
  const Ambulance({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: NavigateAppBar(title: AppLocalizations.of(context)!.ambulance),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            UnorderedListItem(
                itemText:
                    "एम्बुलेन्स सेवा: आपतकालिन अवस्थामा एम्बुलेन्स कल गर्न एक-स्पर्श (one touch) पहुँच।"),
            UnorderedListItem(
                itemText:
                    "GPS ट्र्याकिङ: सही आगमन अनुमानको लागि पठाइएको एम्बुलेन्सहरूको वास्तविक-समय ट्र्याकिङ।"),
            UnorderedListItem(
                itemText:
                    "चिकित्सा जानकारी: उपचारमा सहयोग गर्न प्यारामेडिकहरूसँग आवश्यक चिकित्सा विवरणहरू उपलब्ध गाराउन सकिने। "),
            UnorderedListItem(
                itemText:
                    "आपतकालीन प्राथमिक उपचार: एम्बुलेन्स आउनु अघि तत्काल हेरचाहको लागि आधारभूत प्राथमिक उपचार सुझावहरू र दिशानिर्देशहरू उपलब्ध गाराउन सकिने।"),
            UnorderedListItem(
                itemText:
                    "एम्बुलेन्स सेवा निर्देशिका: सम्पर्क जानकारी र उपलब्धताको स्थिति सहित स्थानीय एम्बुलेन्स सेवाहरूको सूची उपलब्ध गाराउन सकिने।"),
          ]),
        ),
      ),
    );
  }
}
