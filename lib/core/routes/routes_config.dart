import 'package:e_woda/core/routes/routes_string.dart';
import 'package:e_woda/features/Administrative%20Solutions/ContactMayor/contact_mayor.dart';
import 'package:e_woda/features/Administrative%20Solutions/LawAndHumanRights/law_and_human_page.dart';
import 'package:e_woda/features/Administrative%20Solutions/Nagar%20Patro/nagar_calendar.dart';
import 'package:e_woda/features/Administrative%20Solutions/Queries/queries_page.dart';
import 'package:e_woda/features/Community%20Engagement/Education/education_page.dart';
import 'package:e_woda/features/Community%20Engagement/Health/health_page.dart';
import 'package:e_woda/features/Community%20Engagement/Tourism%20Site/tourism_site_page.dart';
import 'package:e_woda/features/Emergency%20Services/Ambulance/ambulance_page.dart';
import 'package:e_woda/features/Emergency%20Services/Police/police_page.dart';
import 'package:e_woda/features/Official%20Notices%20and%20Announcements/E%20Sifaris/e_sifaris_page.dart';
import 'package:e_woda/features/Online%20Information/Blog/blog_page.dart';
import 'package:e_woda/features/Online%20Information/News%20Portal/news_portal_page.dart';

import 'package:e_woda/features/Services/Public%20Forum/public_forum_page.dart';

import 'package:e_woda/features/authentication/User%20Login%20Page/login_user_page.dart';
import 'package:e_woda/features/pdf_viewer/pdf_viewer.dart';
import 'package:flutter/material.dart';

import '../../features/Administrative Solutions/Administration/administration.dart';
import '../../features/Administrative Solutions/Financial services/financial_services_page.dart';
import '../../features/Community Engagement/Environment/environment.dart';
import '../../features/Emergency Services/Hepline Number/helpline_number_page.dart';
import '../../features/Official Notices and Announcements/Notice/notice_page.dart';
import '../../features/Official Notices and Announcements/Suggestions/suggestion_page.dart';
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

      case RouteString.administration:
        return MaterialPageRoute(builder: (context) => const Administration());

      case RouteString.financialServices:
        return MaterialPageRoute(
            builder: (context) => const FinancialServices());

      case RouteString.lawsAndHuman:
        return MaterialPageRoute(
            builder: (context) => const LawAndHumanRights());

      case RouteString.contactMayor:
        return MaterialPageRoute(builder: (context) => const ContactMayor());

      case RouteString.queries:
        return MaterialPageRoute(builder: (context) => const Queries());

      case RouteString.nagarCalendar:
        return MaterialPageRoute(builder: (context) => const NagarCalendar());

      case RouteString.education:
        return MaterialPageRoute(builder: (context) => const Education());

      case RouteString.health:
        return MaterialPageRoute(builder: (context) => const Health());

      case RouteString.environment:
        return MaterialPageRoute(builder: (context) => const Environment());

      case RouteString.tourismArea:
        return MaterialPageRoute(builder: (context) => const TourismSite());

      case RouteString.notice:
        return MaterialPageRoute(builder: (context) => const Notice());

      case RouteString.suggestions:
        return MaterialPageRoute(builder: (context) => const Suggestion());

      case RouteString.eSifaris:
        return MaterialPageRoute(builder: (context) => const ESifaris());

      case RouteString.helplineNumber:
        return MaterialPageRoute(builder: (context) => const HelplineNumber());

      case RouteString.ambulance:
        return MaterialPageRoute(builder: (context) => const Ambulance());

      case RouteString.police:
        return MaterialPageRoute(builder: (context) => const Police());

      case RouteString.newsPortal:
        return MaterialPageRoute(builder: (context) => const NewsPortal());

      case RouteString.blog:
        return MaterialPageRoute(builder: (context) => const Blog());

      case RouteString.publicForum:
        return MaterialPageRoute(builder: (context) => const PublicForum());

      default:
        return MaterialPageRoute(builder: (context) {
          return const Scaffold(
            body: Center(child: Text("No Routes")),
          );
        });
    }
  }
}
