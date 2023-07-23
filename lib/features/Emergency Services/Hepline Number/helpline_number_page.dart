import 'package:e_woda/Common/unordered_list.dart';
import 'package:flutter/material.dart';

import '../../../Common/custom_appbar.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class HelplineNumber extends StatelessWidget {
  const HelplineNumber({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child:
            NavigateAppBar(title: AppLocalizations.of(context)!.helplineNumber),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            UnorderedListItem(
                itemText:
                    "आपतकालीन सम्पर्कहरू: आपतकालीन अवस्थामा तत्काल सहायताको लागि आवश्यक हेल्पलाइन नम्बरहरूमा द्रुत पहुँच गाराउन सकिने।"),
            UnorderedListItem(
                itemText:
                    "चिकित्सा सहायता: चिकित्सा सेवाहरू, अस्पतालहरू, र स्वास्थ्य सेवा प्रदायकहरूको हेल्पलाइन नम्बरहरू उपलब्ध गाराउन सकिने।"),
            UnorderedListItem(
                itemText:
                    "कानून प्रवर्तन: पुलिस, दमकल विभाग, र अन्य आपतकालीन प्रतिक्रिया एजेन्सीहरू संग सम्पर्क स्थापित गाराउन सकिने।"),
            UnorderedListItem(
                itemText:
                    "सामुदायिक सहायता: सुरक्षा चिन्ता, बाल सुरक्षा, र वृद्ध हेरचाह समर्थन रिपोर्ट गर्नका लागि हेल्पलाइनहरू उपलब्ध गाराउन सकिने।"),
          ]),
        ),
      ),
    );
  }
}
