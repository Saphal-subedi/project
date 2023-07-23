// ignore_for_file: unnecessary_const

import 'package:e_woda/Common/custom_appbar.dart';
import 'package:e_woda/Common/unordered_list.dart';
import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localization.dart';

class LawAndHumanRights extends StatelessWidget {
  const LawAndHumanRights({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(60.0),
            child: NavigateAppBar(title: AppLocalizations.of(context)!.laws)),
        body: const SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              UnorderedListItem(
                  itemText:
                      "कानूनी स्रोतहरू: समुदाय भित्र कानुनी जागरूकता प्रवर्द्धन गर्न सान्दर्भिक कानूनी जानकारी, नगरपालिका कानून, र अध्यादेशहरूमा नागरिक को पहुँच।"),
              UnorderedListItem(
                  itemText:
                      "मानव अधिकार: नागरिकहरूको लागि मानव अधिकार संरक्षण र स्रोतहरू बारे जानकारी प्रदान गर्न  सकीनेछ।"),
              UnorderedListItem(
                  itemText:
                      "अधिकार उल्लङ्घनको रिपोर्ट: नागरिकहरूले नागरिक अधिकार उल्लङ्घन वा अन्य कानुनी सरोकारहरू सिधै नगरपालिकामा रिपोर्ट गर्न मिल्ने।"),
              UnorderedListItem(
                  itemText:
                      "कानूनी सहायता: कानुनी सहायताको आवश्यकता परेका नागरिकहरूलाई उपलब्ध कानुनी सहायता सेवाहरू र स्रोतहरूको बारेमा जानकारी प्रदान गर्न मिल्ने।"),
            ],
          ),
        ));
  }
}
