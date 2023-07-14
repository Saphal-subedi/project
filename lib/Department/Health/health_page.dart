import 'package:e_woda/Common/custom_appbar.dart';
import 'package:flutter/material.dart';

import '../apptitle_department.dart';
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
            const Text(
              "The following doctors are currently available",
              style: TextStyle(color: Colors.red),
            ),
            ListView.separated(
                shrinkWrap: true,
                itemBuilder: ((context, index) {
                  return Card(
                    color: Colors.green,
                    child: ListTile(
                      leading: const Text("Doctor Name "),
                      title: Column(
                        children: [
                          const Text("Contact Number"),
                          const SizedBox(height: 10.0),
                          const Text("specialist On")
                        ],
                      ),
                      trailing: TextButton(
                        child: const Text(
                          "Message",
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
