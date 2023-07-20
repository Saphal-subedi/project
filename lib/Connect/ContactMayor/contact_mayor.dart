import 'package:e_woda/Common/custom_appbar.dart';
import 'package:e_woda/Common/unordered_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class ContactMayor extends StatelessWidget {
  const ContactMayor({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child:
              NavigateAppBar(title: AppLocalizations.of(context)!.contactMayor),
          preferredSize: const Size.fromHeight(60.0)),
      body: Column(
        children: [
          UnorderedListItem(
            itemText: AppLocalizations.of(context)!.itemonecontact,
          ),
          const SizedBox(height: 10.0),
          UnorderedListItem(
              itemText: AppLocalizations.of(context)!.itemtwocontact),
          const SizedBox(height: 10.0),
          UnorderedListItem(
              itemText: AppLocalizations.of(context)!.itemthreecontact),
        ],
      ),
    );
  }
}
