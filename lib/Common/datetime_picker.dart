import 'package:flutter/material.dart';
import 'package:nepali_date_picker/nepali_date_picker.dart' as picker;

Future<DateTime?> customADDatePicker(BuildContext context) {
  return showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now());
}

Future<TimeOfDay?> customTimePicker(BuildContext context) {
  return showTimePicker(context: context, initialTime: TimeOfDay.now());
}

Future<DateTime?> customBSDatePicker(BuildContext context) async {
  final selectedDateTime = await picker.showMaterialDatePicker(
    context: context,
    initialDate: picker.NepaliDateTime.now(),
    firstDate: picker.NepaliDateTime(2000),
    lastDate: picker.NepaliDateTime(2090),
    initialDatePickerMode: DatePickerMode.day,
  );
  return selectedDateTime;
}

Future<TimeOfDay?> customBSTimePicker(BuildContext context) {
  return showTimePicker(context: context, initialTime: TimeOfDay.now());
}
