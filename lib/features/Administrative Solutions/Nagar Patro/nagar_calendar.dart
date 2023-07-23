import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

import '../../../Common/custom_appbar.dart';
import 'package:clean_nepali_calendar/clean_nepali_calendar.dart';

class NagarCalendar extends StatefulWidget {
  const NagarCalendar({super.key});

  @override
  State<NagarCalendar> createState() => _NagarCalendarState();
}

class _NagarCalendarState extends State<NagarCalendar> {
  late final NepaliCalendarController _calendarController;
  @override
  void initState() {
    super.initState();
    _calendarController = NepaliCalendarController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60.0),
          child:
              NavigateAppBar(title: AppLocalizations.of(context)!.nagarpatro)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20.0),
            CleanNepaliCalendar(
              controller: _calendarController,
              onDaySelected: (day) {},
            ),
          ],
        ),
      ),
    );
  }
}
