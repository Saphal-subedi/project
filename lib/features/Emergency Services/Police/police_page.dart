import 'package:e_woda/Common/unordered_list.dart';
import 'package:flutter/material.dart';

import '../../../Common/custom_appbar.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class Police extends StatelessWidget {
  const Police({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: NavigateAppBar(title: AppLocalizations.of(context)!.police),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            UnorderedListItem(
                itemText:
                    "आपतकालीन प्रहरी सहायता: अपराध, दुर्घटना, वा सुरक्षा सम्बन्धी मुद्दाहरू रिपोर्ट गर्न प्रत्यक्ष डायल गर्न मिल्ने।"),
            UnorderedListItem(
                itemText:
                    "सामुदायिक पुलिसिंग: प्रशासक र सामुदायिक सहयोगसँग संलग्न हुन स्थानीय प्रहरी स्टेशनहरूको सम्पर्क विवरणहरू उपलब्ध गाराउन सकिने।"),
            UnorderedListItem(
                itemText:
                    "सुरक्षा सुझावहरू: अपराध रोकथाम, व्यक्तिगत सुरक्षा, र सम्पत्ति सुरक्षित गर्ने बारे सुझावहरू उपलब्ध गाराउन सकिने।"),
            UnorderedListItem(
                itemText:
                    "गोप्य रूपमा रिपोर्टिङ: अज्ञात रूपमा पुलिसलाई सुझाव वा जानकारी रिपोर्ट गर्ने विकल्प उपलब्ध गाराउन सकिने।"),
          ]),
        ),
      ),
    );
  }
}
