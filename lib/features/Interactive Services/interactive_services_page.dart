import 'package:e_woda/features/Interactive%20Services/Public%20Forum/public_forum_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

import '../../Common/custom_title_image.dart';

class InteractiveServices extends StatelessWidget {
  const InteractiveServices({super.key});

  @override
  Widget build(BuildContext context) {
    // final height = MediaQuery.of(context).size.height;
    // final width = MediaQuery.of(context).size.width;
    final applocalization = AppLocalizations.of(context);
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.blue.shade50,
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 0, 0, 20),
                child: Text(
                  applocalization!.interactiveservices,
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Row(
                children: [
                  const Spacer(),
                  GestureDetector(
                    child: CustomTitleImage(
                        image: "assets/images/public-forum.png",
                        title: applocalization.publicforum),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PublicForum()));
                    },
                  ),
                  const Spacer(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
