// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:e_woda/Common/custom_appbar.dart';

import 'package:e_woda/Common/custom_textformfield.dart';
import 'package:e_woda/y_urlpage_list.dart';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:logger/logger.dart';

import '../features/authentication/User Login Page/login_user_page.dart';
import 'package:http/http.dart' as http;

import 'BloodGroup/bloodgroup_page.dart';
import 'DocumentGroup/document_group_page.dart';
import 'GenderTypes/gendertype_page.dart';
import 'PalicaGroup/palicatype_page.dart';
import 'StateGroup/statetype_page.dart';
import 'image_picker.dart';

class KycUpdate extends StatelessWidget {
  Future<void> postKyc() async {
    Logger().e("UserId:=$UserId");
    final response = await http.put(
        Uri.parse(
            "https://hedgehog-ready-daily.ngrok-free.app/api/app/user-management"),
        headers: <String, String>{
          'Content-Type': 'multipart/form-data',
          'Accept': 'text/plain',
        },
        body: jsonEncode(
          <String, dynamic>{
            "DocumentImage": imageValue,
            "MiddleName": kycmiddlenameController.text,
            "BloodGroup": seletedBloodId,
            "UserId": UserId,
            "WardName": kycwardnameController.text,
            "City": kyccitynameController.text,
            "Name": kycfirstnameController.text,
            "StateId": selectedStateId,
            "IdCardNo": kycidCardNoController.text,
            "PalikaName": kycpalicaNameController.text,
            "DocumentTypeId": selectedDocumentId,
            "Country": kyccountrynameController.text,
            "DOB": kycdobController.text,
            "PhoneNumber": "+977${kycphoneController.text}",
            "PalicaTypeId": selectedPalicaId,
            "Surname": kycsurnameCOntroller.text,
            "GenderId": selectedGenderId,
            "WardNo": kycwardnoController.text
          },
        ));
    Logger().e(response.body);
  }

  KycUpdate({super.key});
  final kycfirstnameController = TextEditingController();
  final kycmiddlenameController = TextEditingController();
  final kycsurnameCOntroller = TextEditingController();
  final kycphoneController = TextEditingController();
  final kycidCardNoController = TextEditingController();
  final kycdobController = TextEditingController();
  final kycpalicaNameController = TextEditingController();
  final kycwardnoController = TextEditingController();
  final kycwardnameController = TextEditingController();
  final kyccitynameController = TextEditingController();
  final kyccountrynameController = TextEditingController();
  final kycformkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(60.0),
            child: NavigateAppBar(title: "Kyc Update")),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: kycformkey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 30.0),
                    CustomTextFormField(
                      hintText: "FirstName",
                      textController: kycfirstnameController,
                      validate: ((value) {
                        final nameRegex = RegExp(
                            r"^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$");
                        if (!nameRegex.hasMatch(value.toString())) {
                          return AppLocalizations.of(context)!.usernamevalidate;
                        }
                        return null;
                      }),
                    ),
                    const SizedBox(height: 30.0),
                    CustomTextFormField(
                      hintText: "MiddleName",
                      textController: kycmiddlenameController,
                      validate: ((value) {
                        // final nameRegex = RegExp(
                        //     r"^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$");
                        // if (!nameRegex.hasMatch(value.toString())) {
                        //   return AppLocalizations.of(context)!.usernamevalidate;
                        // }
                        return null;
                      }),
                    ),
                    const SizedBox(height: 30.0),
                    CustomTextFormField(
                      hintText: "SurName",
                      textController: kycsurnameCOntroller,
                      validate: ((value) {
                        final nameRegex = RegExp(
                            r"^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$");
                        if (!nameRegex.hasMatch(value.toString())) {
                          return AppLocalizations.of(context)!.usernamevalidate;
                        }
                        return null;
                      }),
                    ),
                    const SizedBox(height: 30.0),
                    CustomTextFormField(
                      hintText: AppLocalizations.of(context)!.phone,
                      textController: kycphoneController,
                      textInputType: TextInputType.number,
                      validate: ((value) {
                        final numberRegex = RegExp(r'^[0-9]{10}$');
                        // RegExp(
                        //     r"^[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]+$");
                        if (!numberRegex.hasMatch(value.toString())) {
                          return "Please Enter valid number";
                        }
                        return null;
                      }),
                    ),
                    const SizedBox(height: 20.0),
                    const Text("Select Your blood Group"),
                    const SizedBox(height: 10.0),
                    const BloodGroupDropDownButton(),
                    const SizedBox(height: 20.0),
                    CustomTextFormField(
                      hintText: "IdCardNo",
                      textController: kycidCardNoController,
                      validate: ((value) {
                        return null;
                      }),
                    ),
                    const SizedBox(height: 30.0),
                    const Text("Select Your document type"),
                    const DocumentTypeDropDownButton(),
                    const SizedBox(height: 20.0),
                    CustomTextFormField(
                      hintText:
                          "Dob:yy-mm-dd and person must be at least 10 years",
                      textController: kycdobController,
                      validate: ((value) {
                        // final datePattern = RegExp(
                        //     r'^(0[1-9]|1[0-9]|2[0-9]|3[0-1])/(0[1-9]|1[0-2])/\d{2}$');
                        // if (!datePattern.hasMatch(value.toString())) {
                        //   return "Format in 2024/09/01 properly";
                        // }
                        return null;
                      }),
                    ),
                    const SizedBox(height: 30.0),
                    CustomTextFormField(
                      hintText: "Palica-Name",
                      textController: kycpalicaNameController,
                      validate: ((value) {
                        final nameRegex = RegExp(
                            r"^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$");
                        if (!nameRegex.hasMatch(value.toString())) {
                          return "Enter Your Correct Palica Name";
                        }
                        return null;
                      }),
                    ),
                    const SizedBox(height: 30.0),
                    CustomTextFormField(
                      hintText: "WardNo",
                      textController: kycwardnoController,
                      validate: ((value) {
                        final nameRegex = RegExp(r'^[0-9]$');
                        if (!nameRegex.hasMatch(value.toString())) {
                          return "Enter Your Correct ward Number";
                        }
                        return null;
                      }),
                    ),
                    const SizedBox(height: 30.0),
                    CustomTextFormField(
                      hintText: "WardName",
                      textController: kycwardnameController,
                      validate: ((value) {
                        final nameRegex = RegExp(
                            r"^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$");
                        if (!nameRegex.hasMatch(value.toString())) {
                          return "Enter Your Correct WardName";
                        }
                        return null;
                      }),
                    ),
                    const SizedBox(height: 20.0),
                    const Text("Select your palica"),
                    const PalicaDropDownButton(),
                    const SizedBox(height: 20.0),
                    CustomTextFormField(
                      hintText: "City",
                      textController: kyccitynameController,
                      validate: ((value) {
                        final nameRegex = RegExp(
                            r"^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$");
                        if (!nameRegex.hasMatch(value.toString())) {
                          return "Enter Your Correct City Name";
                        }
                        return null;
                      }),
                    ),
                    const SizedBox(height: 20.0),
                    const Text("Select Your State"),
                    const StateDropDownButton(),
                    const SizedBox(height: 20.0),
                    CustomTextFormField(
                      hintText: "Country Name",
                      textController: kyccitynameController,
                      validate: ((value) {
                        final nameRegex = RegExp(
                            r"^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$");
                        if (!nameRegex.hasMatch(value.toString())) {
                          return "Enter Your Correct Country Name";
                        }
                        return null;
                      }),
                    ),
                    const SizedBox(height: 20.0),
                    const Text("Select GenderType"),
                    const GenderTypeDropDownButton(),
                    const SizedBox(height: 20.0),
                    ImagePickerScreen(),
                    const SizedBox(height: 30.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              color: Colors.blue.shade300,
                            ),
                            child: TextButton(
                              onPressed: () {
                                if (kycformkey.currentState!.validate()) {
                                  postKyc();
                                }
                              },
                              child: const Padding(
                                padding: EdgeInsets.all(12.0),
                                child: Text(
                                  "Kyc Update",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ]),
            ),
          ),
        ));
  }
}
