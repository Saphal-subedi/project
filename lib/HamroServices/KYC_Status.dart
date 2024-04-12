import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

import '../features/authentication/User Login Page/login_user_page.dart';

class KycStatusModell {
  String? userId;
  String? name;
  String? userName;
  String? surname;
  String? middleName;
  String? email;
  String? phoneNumber;
  String? bloodGroupName;
  String? documentImage;
  String? idCardNo;
  String? documentType;
  String? dob;
  String? palikaName;
  int? wardNo;
  String? wardName;
  String? palikaTypeName;
  String? city;
  String? state;
  String? country;
  String? gender;
  String? roleName;
  String? kycStatus;

  KycStatusModell(
      {this.userId,
      this.name,
      this.userName,
      this.surname,
      this.middleName,
      this.email,
      this.phoneNumber,
      this.bloodGroupName,
      this.documentImage,
      this.idCardNo,
      this.documentType,
      this.dob,
      this.palikaName,
      this.wardNo,
      this.wardName,
      this.palikaTypeName,
      this.city,
      this.state,
      this.country,
      this.gender,
      this.roleName,
      this.kycStatus});

  KycStatusModell.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    name = json['name'];
    userName = json['userName'];
    surname = json['surname'];
    middleName = json['middleName'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    bloodGroupName = json['bloodGroupName'];
    documentImage = json['documentImage'];
    idCardNo = json['idCardNo'];
    documentType = json['documentType'];
    dob = json['dob'];
    palikaName = json['palikaName'];
    wardNo = json['wardNo'];
    wardName = json['wardName'];
    palikaTypeName = json['palikaTypeName'];
    city = json['city'];
    state = json['state'];
    country = json['country'];
    gender = json['gender'];
    roleName = json['roleName'];
    kycStatus = json['kycStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['name'] = this.name;
    data['userName'] = this.userName;
    data['surname'] = this.surname;
    data['middleName'] = this.middleName;
    data['email'] = this.email;
    data['phoneNumber'] = this.phoneNumber;
    data['bloodGroupName'] = this.bloodGroupName;
    data['documentImage'] = this.documentImage;
    data['idCardNo'] = this.idCardNo;
    data['documentType'] = this.documentType;
    data['dob'] = this.dob;
    data['palikaName'] = this.palikaName;
    data['wardNo'] = this.wardNo;
    data['wardName'] = this.wardName;
    data['palikaTypeName'] = this.palikaTypeName;
    data['city'] = this.city;
    data['state'] = this.state;
    data['country'] = this.country;
    data['gender'] = this.gender;
    data['roleName'] = this.roleName;
    data['kycStatus'] = this.kycStatus;
    return data;
  }
}

Future<void> checkStatus() async {
  final String getuserstatus =
      "https://hedgehog-ready-daily.ngrok-free.app/api/app/user-management/$UserId";
  final response = await http.get(Uri.parse(getuserstatus));
  final body = jsonDecode(response.body);
  var result = body['data'];
  KycStatusModell data = KycStatusModell.fromJson(result);

  UserStatus = data.kycStatus;
  Logger().e("The status is  $UserStatus");
  // final body = jsonDecode(response.body);
  // //List<dynamic> items = body['data'];
  // KycStatusModell data = body.map((e) => KycStatusModell.fromJson(e));
  // UserStatus = data.KycStatus.toString();
}
