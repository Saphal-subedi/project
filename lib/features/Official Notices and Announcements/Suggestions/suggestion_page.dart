import 'package:e_woda/Common/custom_appbar.dart';
import 'package:e_woda/Common/unordered_list.dart';
import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localization.dart';

class Suggestion extends StatelessWidget {
  const Suggestion({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60.0),
          child:
              NavigateAppBar(title: AppLocalizations.of(context)!.suggestions),
        ),
        body: const SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              UnorderedListItem(
                  itemText:
                      "नागरिक प्रतिक्रिया: नगरपालिका सेवा सुधार गर्न विचार र प्रतिक्रिया सङ्कलन गर्न सकिने।"),
              UnorderedListItem(
                  itemText:
                      "सार्वजनिक प्रस्तावहरू: सामुदायिक सुधार परियोजनाहरू प्रस्ताव गर्न  सकीने।"),
              UnorderedListItem(
                  itemText:
                      "दिगोपनका अवधारणाहरू: नगरपालिकाको लागि पर्यावरण-मैत्री सुझावहरू पेश गर्न  सकीने।"),
              UnorderedListItem(
                  itemText:
                      "नागरिक सहभागिता: स्थानीय पहलका लागि सर्वेक्षण र मतदानमा संलग्न गाराउन सकिने।"),
              UnorderedListItem(
                  itemText:
                      "योगदानहरूको पहिचान: उत्कृष्ट सामुदायिक योगदानहरूको कदर गर्न मिल्ने।"),
            ],
          ),
        ));
  }
}
