import 'package:e_woda/Common/custom_appbar.dart';
import 'package:e_woda/Common/unordered_list.dart';
import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localization.dart';

class Notice extends StatelessWidget {
  const Notice({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(60.0),
            child: NavigateAppBar(title: AppLocalizations.of(context)!.notice)),
        body: const SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              UnorderedListItem(
                  itemText:
                      "सार्वजनिक सूचनाहरू: नगरपालिकाका आधिकारिक घोषणाहरू, घटनाहरू, र नीति परिवर्तनहरू जानकरी गाराउन सकिने। ।"),
              UnorderedListItem(
                  itemText:
                      "मर्मत सुविधा: पानी र बिजुली जस्ता सुविधाहरूको लागि नियमित मर्मत तालिकाको जानकारी गाराउन सकिने।"),
              UnorderedListItem(
                  itemText:
                      "प्रकोप अलर्टहरू: प्राकृतिक प्रकोप र आपतकालीन अवस्थाहरूको लागि अलर्टहरू गाराउन सकिने।"),
            ],
          ),
        ));
  }
}
