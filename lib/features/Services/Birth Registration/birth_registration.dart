import 'package:flutter/material.dart';

import '../../../Common/custom_appbar.dart';
import '../../../Common/unordered_list.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class BirthRegistration extends StatelessWidget {
  const BirthRegistration({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: NavigateAppBar(
            title: AppLocalizations.of(context)!.birthRegistration),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            AppLocalizations.of(context)!.birth_title,
            style: const TextStyle(
                fontSize: 14.0, fontWeight: FontWeight.w600, color: Colors.red),
          ),
          const SizedBox(height: 10.0),
          UnorderedListItem(itemText: AppLocalizations.of(context)!.itemone),
          const SizedBox(height: 10.0),
          UnorderedListItem(itemText: AppLocalizations.of(context)!.itemtwo),
          const SizedBox(height: 10.0),
          UnorderedListItem(itemText: AppLocalizations.of(context)!.itemthree),
          const SizedBox(height: 10.0),
          UnorderedListItem(itemText: AppLocalizations.of(context)!.itemfour),
        ]),
      ),
    );
  }
}
