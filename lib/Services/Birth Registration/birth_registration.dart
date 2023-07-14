import 'package:e_woda/Services/apptitle_services.dart';
import 'package:flutter/material.dart';

import '../../Common/custom_appbar.dart';
import '../../Common/unordered_list.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class BirthRegistration extends StatelessWidget {
  const BirthRegistration({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: NavigateAppBar(
            title: AppLocalizations.of(context)!.birthRegistration),
        preferredSize: const Size.fromHeight(60),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text(
            "Required document for birth registration",
            style: TextStyle(
                fontSize: 14.0, fontWeight: FontWeight.w600, color: Colors.red),
          ),
          const SizedBox(height: 10.0),
          UnorderedListItem(
              itemText:
                  "Proof of Birth: This can include documents such as a hospital-issued birth certificate, maternity record, or any other document that verifies the birth of the child."),
          const SizedBox(height: 10.0),
          UnorderedListItem(
              itemText:
                  "Parent's Identification Documents: The identification documents of both parents, such as citizenship certificates, passports, or other valid identification papers."),
          const SizedBox(height: 10.0),
          UnorderedListItem(
              itemText:
                  "Citizenship Certificate of Parents: The citizenship certificates of both parents."),
          const SizedBox(height: 10.0),
          UnorderedListItem(
              itemText:
                  "Affidavit of Birth: In cases where the birth was not registered immediately or there is a delay, an affidavit explaining the reason for the delay may be required."),
        ]),
      ),
    );
  }
}
