import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class TopContainer extends StatelessWidget {
  const TopContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    // DateTimeModel dateTimeModel =
    //  Provider.of<DateTimeModel>(context, listen: false);
    return Container(
      width: double.infinity,
      height: height * 0.1,
      decoration: const BoxDecoration(
        color: Color(0xFF66D47E),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            AppLocalizations.of(context)!.name,
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w900),
          ),
          Text(
            AppLocalizations.of(context)!.district,
            style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w900),
          ),
          const Text(
            "2080/06/15 Sunday",
            style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w900),
          ),

          // Consumer<DateTimeModel>(
          //       builder: (context, counterModel, child) {
          //         return Text(
          //           DateTimeModel.,
          //           style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          //         );
          //       },
          //     ),
          // Text(
          //  // dateTimeModel.dateTime.toString(),
          //   style: TextStyle(fontSize: 18),
          // ),
        ],
      ),
    );
  }
}
