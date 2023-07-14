import 'package:e_woda/Common/custom_appbar.dart';
import 'package:flutter/material.dart';

import '../apptitle_department.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class Notice extends StatelessWidget {
  const Notice({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            child: NavigateAppBar(title: AppLocalizations.of(context)!.notice),
            preferredSize: Size.fromHeight(60.0)),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [],
        ));
  }
}
