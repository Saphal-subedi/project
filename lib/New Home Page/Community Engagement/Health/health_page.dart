import 'package:e_woda/Common/custom_appbar.dart';
import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localization.dart';

class Health extends StatelessWidget {
  const Health({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            child: NavigateAppBar(title: AppLocalizations.of(context)!.health),
            preferredSize: const Size.fromHeight(60.0)),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context)!.health_title,
              style: TextStyle(color: Colors.red),
            ),
            ListView.separated(
                shrinkWrap: true,
                itemBuilder: ((context, index) {
                  return Card(
                    color: Colors.green,
                    child: ListTile(
                      leading: Text(AppLocalizations.of(context)!.doctorname),
                      title: Column(
                        children: [
                          Text(AppLocalizations.of(context)!.contactno),
                          const SizedBox(height: 10.0),
                          Text(AppLocalizations.of(context)!.specialist_On)
                        ],
                      ),
                      trailing: TextButton(
                        child: Text(
                          AppLocalizations.of(context)!.message,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                            // background: Colors.red,
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ),
                  );
                }),
                separatorBuilder: ((context, index) {
                  return const SizedBox(height: 10.0);
                }),
                itemCount: 5),
          ],
        ));
  }
}
