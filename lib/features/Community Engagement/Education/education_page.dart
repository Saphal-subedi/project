import 'package:e_woda/Common/custom_appbar.dart';
import 'package:e_woda/Common/unordered_list.dart';
import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localization.dart';

class Education extends StatelessWidget {
  const Education({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(60.0),
            child:
                NavigateAppBar(title: AppLocalizations.of(context)!.education)),
        body: const SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              UnorderedListItem(
                  itemText:
                      "विद्यालय र कलेजहरू: सार्वजनिक, निजी स्कूल र कलेजहरूका निर्देशिका उपलब्ध गाराउन सकिने।"),
              UnorderedListItem(
                  itemText:
                      "छात्रवृत्तिका अवसरहरू: कम आय भएका समूहका विद्यार्थीहरू र उज्ज्वल विद्यार्थीहरूलाई सहयोग गर्न उपलब्ध छात्रवृत्ति कार्यक्रमहरू र वित्तीय सहायताहरूको जानकरी गाराउन सकिने।"),
              UnorderedListItem(
                  itemText:
                      "शैक्षिक स्रोतहरू: कक्षाकोठाको सिकाइलाई पूर्ण बनाउन र शैक्षिक अवसरहरू बढाउन विद्यार्थी भाइ बहिनीहरूलाई सिकाई सामग्रीहरू, शैक्षिक भिडियोहरू र ई-पुस्तकहरूमा पहुँच प्रदान गर्न  सकीनेछ।"),
              UnorderedListItem(
                  itemText:
                      "शिक्षक सहायता: शिक्षकहरूलाई उनीहरूको शिक्षण विधि र दृष्टिकोण सुधार गर्न स्रोतहरू र प्रशिक्षण सामग्रीहरू प्रदान गर्न  सकीनेछ।"),
              UnorderedListItem(
                  itemText:
                      "सामुदायिक सिकाइ केन्द्रहरू: युवा र वयस्कहरूको लागि सीप विकास र व्यावसायिक तालिम प्रदान गर्ने समुदायमा आधारित सिकाइ केन्द्रहरूलाई प्रवर्द्धन गर्न  सकीनेछ।"),
            ],
          ),
        ));
  }
}
