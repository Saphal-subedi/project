import 'package:e_woda/Common/custom_appbar.dart';
import 'package:e_woda/Common/unordered_list.dart';
import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localization.dart';

class Environment extends StatelessWidget {
  const Environment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(60.0),
            child: NavigateAppBar(
                title: AppLocalizations.of(context)!.environment)),
        body: const SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              UnorderedListItem(
                  itemText:
                      "रिसाइक्लिङ्ग र फोहोर व्यवस्थापन: नागरिकहरूलाई रिसाइक्लिङ्ग र फोहोर पृथकीकरणको महत्त्व बारे शिक्षित गर्न र स्थानीय फोहोर व्यवस्थापनका पहलहरूलाई सुनिश्चित गर्न  सकीनेछ।"),
              UnorderedListItem(
                  itemText:
                      "हराभरा वातावरण: वृक्षा रोपण, नवीकरणीय ऊर्जा कार्यक्रमहरू जस्ता वातावरण मैत्री परियोजनाहरू प्रदर्शन गर्न  सकीनेछ।"),
              UnorderedListItem(
                  itemText:
                      "सरसफाई अभियानहरू: स्वच्छ र स्वस्थ वातावरण कायम राख्न सामुदायिक सरसफाई कार्यक्रमहरू आयोजना र प्रवर्द्धन गर्न  सकीनेछ।"),
            ],
          ),
        ));
  }
}
