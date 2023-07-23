// import 'package:e_woda/features/Department/Education/education_page.dart';
// import 'package:e_woda/features/Department/Environment/environment.dart';
// import 'package:e_woda/features/Department/Financial%20services/financial_services_page.dart';
// import 'package:e_woda/features/Department/LawAndHumanRights/law_and_human_page.dart';
// import 'package:e_woda/features/Department/Notice/notice_page.dart';
// import 'package:e_woda/features/Department/Urban%20Management/urban_management.dart';
// import 'package:e_woda/features/Department/custom_container.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_gen/gen_l10n/app_localization.dart';

// import 'Health/health_page.dart';

// class Department extends StatelessWidget {
//   const Department({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // final height = MediaQuery.of(context).size.height;
//     final width = MediaQuery.of(context).size.width;
//     final applocalization = AppLocalizations.of(context);
//     return Padding(
//       padding: EdgeInsets.all(0.018 * width),
//       child: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(20.0),
//           color: Colors.blue.shade50,
//         ),
//         child: Center(
//           child: Padding(
//             padding: const EdgeInsets.all(12.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Padding(
//                   padding: EdgeInsets.fromLTRB(0.06 * width, 0, 0, 10),
//                   child: Text(
//                     applocalization!.administratrativesolutions,
//                     style: const TextStyle(
//                       fontSize: 20.0,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 ),
//                 Row(
//                   children: [
//                     const Spacer(),
//                     GestureDetector(
//                       onTap: (() {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => const Administration()));
//                       }),
//                       child: CustomImageTitle(
//                           index: 0, title: applocalization.administration),
//                     ),
//                     const Spacer(),
//                     GestureDetector(
//                       onTap: (() {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => const Health()));
//                       }),
//                       child: CustomImageTitle(
//                           index: 2, title: applocalization.health),
//                     ),
//                     const Spacer(),
//                     GestureDetector(
//                       onTap: (() {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => const Notice()));
//                       }),
//                       child: Stack(
//                         children: [
//                           CustomImageTitle(
//                               index: 3, title: applocalization.notice),
//                           const Positioned(
//                             right: 0,
//                             child: CircleAvatar(
//                               backgroundColor: Colors.red,
//                               radius: 5,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     const Spacer(),
//                     GestureDetector(
//                       onTap: (() {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) =>
//                                     const FinancialServices()));
//                       }),
//                       child: CustomImageTitle(
//                           index: 4, title: applocalization.financialService),
//                     ),
//                     const Spacer(),
//                   ],
//                 ),
//                 const SizedBox(height: 20.0),
//                 Row(
//                   children: [
//                     const Spacer(),
//                     GestureDetector(
//                       onTap: (() {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => const Education()));
//                       }),
//                       child: CustomImageTitle(
//                           index: 1, title: applocalization.education),
//                     ),
//                     const Spacer(),
//                     GestureDetector(
//                       onTap: (() {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => const Environment()));
//                       }),
//                       child: CustomImageTitle(
//                           index: 5, title: applocalization.environment),
//                     ),
//                     const Spacer(),
//                     GestureDetector(
//                       onTap: (() {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => const UrbanManagement()));
//                       }),
//                       child: CustomImageTitle(
//                           index: 6, title: applocalization.urbanManagement),
//                     ),
//                     const Spacer(),
//                     GestureDetector(
//                       onTap: (() {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) =>
//                                     const LawAndHumanRights()));
//                       }),
//                       child: CustomImageTitle(
//                           index: 7, title: applocalization.laws),
//                     ),
//                     const Spacer(),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
