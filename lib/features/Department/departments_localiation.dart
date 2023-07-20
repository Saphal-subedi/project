import 'package:e_woda/features/Department/apptitle_department.dart';
import 'package:e_woda/features/Department/app_image.dart';

class ImageString {
  String images;
  String title;
  ImageString({required this.images, required this.title});
}

List<ImageString> imgString = [
  ImageString(images: AppImage.administration, title: Apptitle.administration),
  ImageString(images: AppImage.education, title: Apptitle.education),
  ImageString(images: AppImage.health, title: Apptitle.health),
  ImageString(images: AppImage.notice, title: Apptitle.notice),
  ImageString(
      images: AppImage.financialService, title: Apptitle.financialService),
  ImageString(images: AppImage.environment, title: Apptitle.environment),
  ImageString(
      images: AppImage.urbanManagement, title: Apptitle.urbanManagement),
  ImageString(images: AppImage.laws, title: Apptitle.laws),
];

class DepartmentTitle {
  static const String title = "Department";
}
