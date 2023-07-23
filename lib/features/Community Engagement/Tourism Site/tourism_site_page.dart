import 'package:e_woda/Common/unordered_list.dart';
import 'package:flutter/material.dart';

import '../../../Common/custom_appbar.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class TourismSite extends StatelessWidget {
  const TourismSite({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: NavigateAppBar(title: AppLocalizations.of(context)!.tourismSite),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            UnorderedListItem(
                itemText:
                    "पर्यटक आकर्षण: स्थानीय पर्यटन प्रवर्द्धन गर्न लोकप्रिय पर्यटक गन्तव्यहरू, ऐतिहासिक स्थलहरू, प्राकृतिक स्थलहरू, र सांस्कृतिक हटस्पटहरू हाइलाइट गर्न  सकीनेछ।"),
            UnorderedListItem(
                itemText:
                    "स्थानीय गाइडहरू: ऐतिहासिक र सांस्कृतिक महत्त्व उजागर गर्दै विभिन्न स्थानहरूमा भ्रमण गर्ने पर्यटकहरूलाई भर्चुअल गाइड वा अडियो टुरहरू प्रदान गर्न  सकीनेछ। "),
            UnorderedListItem(
                itemText:
                    "जिम्बेवारी मूलक पर्यटन: स्थानीय संस्कृति, वातावरण र सम्पदाको संरक्षण गर्न दिगो र जिम्बेवारी मूलक पर्यटन अभ्यासहरूलाई प्रोत्साहन गर्न  सकीने।"),
            UnorderedListItem(
                itemText:
                    "सामुदायिक पर्यटन: स्थानीय समुदायहरूलाई समावेश गर्न र उनीहरूलाई आर्थिक लाभ प्रदान गर्न समुदायमा आधारित पर्यटन पहलहरूलाई समर्थन गर्न  सकीने।"),
          ]),
        ),
      ),
    );
  }
}
