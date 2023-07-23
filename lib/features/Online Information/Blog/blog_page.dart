import 'package:e_woda/Common/unordered_list.dart';
import 'package:flutter/material.dart';

import '../../../Common/custom_appbar.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class Blog extends StatelessWidget {
  const Blog({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: NavigateAppBar(title: AppLocalizations.of(context)!.blog),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            UnorderedListItem(
                itemText:
                    "विविध विषयहरू: जीवन शैली, संस्कृति, प्रविधि, र थप अन्य विषयहरूको विस्तृत दायरा समेट्ने ब्लगहरूको संग्रह खोज्न र अध्ययन गर्न मिल्ने।"),
            UnorderedListItem(
                itemText:
                    "स्थानीय परिप्रेक्ष्यहरू: समुदायका सदस्यहरूका ब्लगहरू पढ्न सकिने, जसले सम्बंधित नगरीको बारेमा अद्वितीय अन्तर्दृष्टि र अनुभवहरू प्रदान गर्दछ।"),
            UnorderedListItem(
                itemText:
                    "अतिथि ब्लगरहरू: अतिथि तथा विशेषज्ञहरूले आफ्न बहुमूल्य ज्ञान र विचारहरू उपलब्ध गाराउन सक्ने छन।"),
            UnorderedListItem(
                itemText:
                    "टिप्पणी र सामग्री प्रस्तुत: पोस्टहरूमा टिप्पणी गरेर र सामाजिक सञ्जालमा सामग्री प्रस्तुत गरेर ब्लगरहरूसँग अन्तरक्रिया गर्न  सकीनेछ।"),
            UnorderedListItem(
                itemText:
                    "•	ट्रेन्डिङ ब्लगहरू: प्रयोगकर्ताहरूका लागी लोकप्रिय र ट्रेन्डिङ ब्लगहरू हाइलाइट गर्न  सकीनेछ।"),
          ]),
        ),
      ),
    );
  }
}
