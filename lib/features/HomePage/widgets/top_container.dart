// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:carousel_slider/carousel_slider.dart';

class TopContainer extends StatelessWidget {
  const TopContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    // DateTimeModel dateTimeModel =
    //  Provider.of<DateTimeModel>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: CarouselSlider(
        options: CarouselOptions(height: height * 0.2),
        items: [1, 2, 3, 4, 5].map((i) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Colors.blue.shade300,
                  ),
                  child: Center(
                    child: Text(
                      'News $i',
                      style:
                          const TextStyle(fontSize: 30.0, color: Colors.white),
                    ),
                  ));
            },
          );
        }).toList(),
      ),
    );
    // child: Container(
    //   width: double.infinity,
    //   height: height * 0.3,
    //   decoration: const BoxDecoration(
    //     gradient: LinearGradient(
    //       colors: [
    //         Color(0xFF000099),
    //         Color(0xFFff6600),
    //       ],
    //       begin: Alignment.centerLeft,
    //       end: Alignment.centerRight,
    //     ),
    //     borderRadius: BorderRadius.only(
    //       bottomLeft: Radius.circular(20.0),
    //       bottomRight: Radius.circular(20.0),
    //     ),
    //   ),
    //   child: Column(
    //     crossAxisAlignment: CrossAxisAlignment.center,
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     children: [
    //       Text(
    //         AppLocalizations.of(context)!.name,
    //         style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w900),
    //       ),
    //       Text(
    //         AppLocalizations.of(context)!.district,
    //         style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w900),
    //       ),
    //       const Text(
    //         "2080/06/15 Sunday",
    //         style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w900),
    //       ),

    //     ],
    //   ),
    // ),
  }
}
