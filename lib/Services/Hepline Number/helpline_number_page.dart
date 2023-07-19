import 'package:flutter/material.dart';

import '../../Common/custom_appbar.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class HelplineNumber extends StatelessWidget {
  const HelplineNumber({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child:
            NavigateAppBar(title: AppLocalizations.of(context)!.helplineNumber),
        preferredSize: const Size.fromHeight(60),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, children: const []),
      ),
    );
  }
}
