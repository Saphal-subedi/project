import 'package:e_woda/core/routes/routes_string.dart';
import 'package:e_woda/features/authentication/User%20Login%20Page/login_user_page.dart';
import 'package:e_woda/features/pdf_viewer/pdf_viewer.dart';
import 'package:flutter/material.dart';

import '../../features/Services/Birth Registration/widget/birth_info_form.dart';

class AppRoutes {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RouteString.login:
        return MaterialPageRoute(builder: (context) => LoginUser());

      case RouteString.birthInformForm:
        return MaterialPageRoute(builder: (context) => const BirthInfoForm());

      case RouteString.pdfViewer:
        var args = settings.arguments as Map;
        return MaterialPageRoute(
            builder: (context) => PDFViewer(url: args["url"]));

      default:
        return MaterialPageRoute(builder: (context) {
          return const Scaffold(
            body: Center(child: Text("No Routes")),
          );
        });
    }
  }
}
