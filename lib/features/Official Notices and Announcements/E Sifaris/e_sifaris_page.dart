import 'package:e_woda/Common/unordered_list.dart';
import 'package:flutter/material.dart';

import '../../../Common/custom_appbar.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class ESifaris extends StatelessWidget {
  const ESifaris({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: NavigateAppBar(title: AppLocalizations.of(context)!.esifarish),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            UnorderedListItem(
                itemText:
                    "सिफारिस पेस: वडा प्रतिनिधिहरूले नागरिकता, राहदानी, सम्बन्ध प्रमाणपत्र, इत्यादिको मागको आधारमा नागरिकहरूलाई सिफारिसहरू प्रदान गर्न मिल्ने।"),
          ]),
        ),
      ),
    );
  }
}
