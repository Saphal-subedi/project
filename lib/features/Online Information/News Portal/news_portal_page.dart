// ignore_for_file: unnecessary_const

import 'package:e_woda/Common/unordered_list.dart';
import 'package:flutter/material.dart';

import '../../../Common/custom_appbar.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class NewsPortal extends StatelessWidget {
  const NewsPortal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: NavigateAppBar(title: AppLocalizations.of(context)!.newsportal),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            UnorderedListItem(
                itemText:
                    "समाचार अपडेट: स्थानीय, राष्ट्रिय र अन्तर्राष्ट्रिय घटनाहरू कभर गर्ने नियमित समाचार लेखहरूको सुचना उपलब्ध गाराउन सकिने।"),
            UnorderedListItem(
                itemText:
                    "वर्गीकरण: सजिलो ब्राउजिङका लागि राजनीति, अर्थतन्त्र, खेलकुद र मनोरञ्जन जस्ता खण्डहरूमा विभाजन गरिएका समाचारहरू प्राप्त गर्न  सकीनेछ।"),
            UnorderedListItem(
                itemText:
                    "ताजा समाचार अलर्टहरू: महत्त्वपूर्ण घटनाहरू र ताजा समाचारहरूका लागि वास्तविक-समय सूचनाहरू प्राप्त गर्न  सकीनेछ।"),
            UnorderedListItem(
                itemText:
                    "मल्टिमिडिया सामग्री: आकर्षक समाचार अनुभवको लागि समाचार भिडियोहरू, तस्बिरहरू, र अन्तरक्रियात्मक मिडियाको पहुँच उपलब्ध गाराउन मिल्ने।"),
            UnorderedListItem(
                itemText:
                    "प्रयोगकर्ताहरूको छलफल: समाचार शीर्षकहरूमा सामुदायिक छलफल र टिप्पणीहरूमा संलग्न गाराउन मिल्ने।"),
          ]),
        ),
      ),
    );
  }
}
