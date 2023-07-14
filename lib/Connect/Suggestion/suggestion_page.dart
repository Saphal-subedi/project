import 'package:e_woda/Common/custom_appbar.dart';
import 'package:e_woda/Connect/apptitle_connect.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class Suggestions extends StatelessWidget {
  const Suggestions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            child: NavigateAppBar(
                title: AppLocalizations.of(context)!.suggestions),
            preferredSize: const Size.fromHeight(60.0)),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [],
        ));
  }
}
