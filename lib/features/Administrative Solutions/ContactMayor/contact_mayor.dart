import 'package:e_woda/Common/custom_appbar.dart';
import 'package:e_woda/Common/unordered_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class ContactMayor extends StatelessWidget {
  const ContactMayor({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60.0),
          child: NavigateAppBar(
              title: AppLocalizations.of(context)!.contactMayor)),
      body: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                "मेयर विवरण",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Center(
              child: Image(
                image: AssetImage("assets/images/mayor.png"),
                height: 100,
                width: 100,
              ),
            ),
            SizedBox(height: 10.0),
            Center(child: Text("मेयरको नाम:-")),
            SizedBox(height: 10.0),
           
            Center(child: Text("संपर्क नम्बर:-123456789")),
            UnorderedListItem(
                itemText:
                    "प्रत्यक्ष सन्देश: नागरिकहरूले सन्देशहरू र सोधपुछहरू सिधै मेयरलाई पठाउन मिल्ने।"),
            UnorderedListItem(
                itemText:
                    "बैठकहरू: नागरिकहरूले समुदाय-सम्बन्धित छलफलहरूको लागि एप मार्फत मेयरसँग भेटघाट वा बैठकहरू प्रस्ताब गर्न मिल्ने।"),
            UnorderedListItem(
                itemText:
                    "प्रतिक्रिया पेस: नागरिकहरूले प्रतिक्रिया, सुझावहरू, र गुनासोहरू सिधै मेयरको कार्यालयमा पेश गर्न प्लेटफर्म दिन सकिने।"),
            UnorderedListItem(
                itemText:
                    "मेयरको पहल: चलिरहेका परियोजनाहरू, पहलहरू, र समुदायको फाइदाको लागि प्राथमिकताहरू बारे सूचित गर्न मिल्ने।"),
            UnorderedListItem(
                itemText:
                    "कार्यक्रमहरू र संलग्नताहरू: मेयरका आगामी सार्वजनिक कार्यक्रमहरू, सामुदायिक बैठकहरू र संलग्नताहरूको बारेमा जानकारी दिन सकीनेछ।"),
          ],
        ),
      ),
    );
  }
}
