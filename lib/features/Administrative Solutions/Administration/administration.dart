import 'package:e_woda/Common/custom_appbar.dart';
import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localization.dart';

import '../../../Common/unordered_list.dart';

class Administration extends StatelessWidget {
  const Administration({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(60.0),
            child: NavigateAppBar(
                title: AppLocalizations.of(context)!.administration)),
        body: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            UnorderedListItem(
                itemText:
                    "निर्वाचित प्रतिनिधिहरुको विवरण: मेयर, काउन्सिल सदस्यहरू, र अन्य प्रतिनिधिहरू, सम्पर्क विवरणहरू र कार्यालयका सर्तहरू सहितको जानकरी उपलब्ध गाराउन सकिने।"),
            UnorderedListItem(
                itemText:
                    "कागजात र नीतिहरू: पारदर्शिता र जनचेतनाको लागि आवश्यक नगरपालिका कागजातहरू, उपनियमहरू, र नीतिहरू सजिलै उपलब्ध हुने छन।"),
            UnorderedListItem(
                itemText:
                    "सेवा को लागी अनुरोध: नागरिकहरूलाई नगरपालिका सेवाहरू जस्तै भवन अनुमति, व्यवसाय इजाजतपत्र, फोहोर संकलन,  एप मार्फत थप प्रभावकारी रूपमा आवेदन गर्न सक्षम बनाउनेछ।"),
          ],
        ));
  }
}
