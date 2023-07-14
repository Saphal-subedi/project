import 'package:e_woda/Connect/app_image.dart';
import 'package:e_woda/Connect/apptitle_connect.dart';

import '../Department/departments_localiation.dart';

List<ImageString> connectString = [
  ImageString(
      images: AppImageConnect.contactMayor,
      title: ApptitleConnect.contactMayor),
  ImageString(
      images: AppImageConnect.suggestions, title: ApptitleConnect.suggestions),
  ImageString(images: AppImageConnect.queries, title: ApptitleConnect.queries),
];

class ConnectTitle {
  static const String title = "Connect";
}
