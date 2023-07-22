// ignore_for_file: prefer_const_constructors

import 'package:e_woda/Common/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class Queries extends StatelessWidget {
  const Queries({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(60.0),
            child:
                NavigateAppBar(title: AppLocalizations.of(context)!.queries)),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [],
        ));
  }
}
