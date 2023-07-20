import '../Department/departments_localiation.dart';
import 'app_image.dart';
import 'apptitle_services.dart';

List<ImageString> servicesString = [
  ImageString(
      images: AppImageServices.birthRegistration,
      title: ApptitleServices.birthRegistration),
  ImageString(
      images: AppImageServices.marriageRegristration,
      title: ApptitleServices.marriageRegristration),
  ImageString(
      images: AppImageServices.deathRegristration,
      title: ApptitleServices.deathRegristration),
  ImageString(
      images: AppImageServices.taxPayment, title: ApptitleServices.taxPayment),
  ImageString(
      images: AppImageServices.helplineNumber,
      title: ApptitleServices.helplineNumber),
  ImageString(
      images: AppImageServices.wardInfo, title: ApptitleServices.wardInfo),
  ImageString(
      images: AppImageServices.tourismSite,
      title: ApptitleServices.tourismSite),
  ImageString(
      images: AppImageServices.esifarish, title: ApptitleServices.esifarish),
  ImageString(
      images: AppImageServices.publicforum,
      title: ApptitleServices.publicforum),
];

class ServicesTitle {
  static const String title = "Services";
}
