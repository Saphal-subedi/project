import 'package:e_woda/Common/custom_appbar.dart';
import 'package:e_woda/Common/unordered_list.dart';
import 'package:e_woda/Connect/apptitle_connect.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class ContactMayor extends StatelessWidget {
  const ContactMayor({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child:
              NavigateAppBar(title: AppLocalizations.of(context)!.contactMayor),
          preferredSize: const Size.fromHeight(60.0)),
      body: Column(
        children: [
          UnorderedListItem(
              itemText:
                  "Personal Information: Contact mayor systems typically store personal information about the mayors or local representatives, such as their full name, address, contact details (phone number, email), and other identifying information."),
          const SizedBox(height: 10.0),
          UnorderedListItem(
              itemText:
                  "Meeting and Event Information: Some contact mayor systems may also store information about upcoming meetings, events, or town hall sessions organized by the mayor. This helps citizens stay informed about public engagements and participate in relevant events."),
          const SizedBox(height: 10.0),
          UnorderedListItem(
              itemText:
                  "Communication History: Contact mayor systems often maintain a record of communication between citizens and the mayor. This can include logs of emails, messages, or phone calls exchanged between the mayor and constituents. It helps track interactions, address citizen concerns, and maintain a history of communication for reference."),
        ],
      ),
    );
  }
}
