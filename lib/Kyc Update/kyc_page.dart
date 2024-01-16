// ignore_for_file: use_build_context_synchronously

import 'package:e_woda/Common/custom_appbar.dart';

import 'package:e_woda/Common/custom_textformfield.dart';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

import '../features/authentication/User Login Page/login_user_page.dart';

class KycUpdate extends StatelessWidget {
  KycUpdate({super.key});
  final kycfirstnameController = TextEditingController();
  final kycmiddlenameController = TextEditingController();
  final kycsurnameCOntroller = TextEditingController();
  final kycdobController = TextEditingController();
  final kycpalicaNameController = TextEditingController();
  final kycwardnoController = TextEditingController();
  final kycwardnameController = TextEditingController();
  final kyccitynameController = TextEditingController();
  final kyccountrynameController = TextEditingController();

  final passwordController = TextEditingController();
  final kycphoneController = TextEditingController();
  final kycidCardNoController = TextEditingController();
  final kycformkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(60.0),
            child: NavigateAppBar(
                title: AppLocalizations.of(context)!.registerUser)),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: kycformkey,
              child: Column(children: [
                const SizedBox(height: 30.0),
                CustomTextFormField(
                  hintText: "FirstName",
                  textController: kycfirstnameController,
                  validate: ((value) {
                    final nameRegex =
                        RegExp(r"^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$");
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
                    final nameRegex =
                        RegExp(r"^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$");
                    if (!nameRegex.hasMatch(value.toString())) {
                      return AppLocalizations.of(context)!.usernamevalidate;
                    }
                    return null;
                  }),
                ),
                const SizedBox(height: 30.0),
                CustomTextFormField(
                  hintText: "SurName",
                  textController: kycsurnameCOntroller,
                  validate: ((value) {
                    final nameRegex =
                        RegExp(r"^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$");
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
                const SizedBox(height: 30.0),
                const Text("Blood Group Here"),
                const SizedBox(height: 30.0),
                const Text("Image Document here"),
                const SizedBox(height: 30.0),
                CustomTextFormField(
                  hintText: "IdCardNo",
                  textController: kycidCardNoController,
                  validate: ((value) {
                    return null;
                  }),
                ),
                const SizedBox(height: 30.0),
                const Text("DocumentTypeId"),
                const SizedBox(height: 30.0),
                CustomTextFormField(
                  hintText: "Dob:yy/mm/dd",
                  textController: kycdobController,
                  validate: ((value) {
                    return null;
                  }),
                ),
                const SizedBox(height: 30.0),
                CustomTextFormField(
                  hintText: "PalicaName",
                  textController: kycpalicaNameController,
                  validate: ((value) {
                    final nameRegex =
                        RegExp(r"^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$");
                    if (!nameRegex.hasMatch(value.toString())) {
                      return "Please enter your Palika Name";
                    }
                    return null;
                  }),
                ),
                const SizedBox(height: 30.0),
                CustomTextFormField(
                  hintText: "Palica-Name",
                  textController: kycpalicaNameController,
                  validate: ((value) {
                    final nameRegex =
                        RegExp(r"^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$");
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
                    final nameRegex =
                        RegExp(r"^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$");
                    if (!nameRegex.hasMatch(value.toString())) {
                      return "Enter Your Correct WardName";
                    }
                    return null;
                  }),
                ),
                const SizedBox(height: 30.0),
                const Text("PalicaTypeId"),
                const SizedBox(height: 30.0),
                CustomTextFormField(
                  hintText: "City",
                  textController: kyccitynameController,
                  validate: ((value) {
                    final nameRegex =
                        RegExp(r"^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$");
                    if (!nameRegex.hasMatch(value.toString())) {
                      return "Enter Your Correct City Name";
                    }
                    return null;
                  }),
                ),
                const SizedBox(height: 30.0),
                const Text("StateId"),
                const SizedBox(height: 30.0),
                CustomTextFormField(
                  hintText: "Country Name",
                  textController: kyccitynameController,
                  validate: ((value) {
                    final nameRegex =
                        RegExp(r"^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$");
                    if (!nameRegex.hasMatch(value.toString())) {
                      return "Enter Your Correct Country Name";
                    }
                    return null;
                  }),
                ),
                const SizedBox(height: 30.0),
                const Text("GenderId"),
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
                          onPressed: (() {
                            if (kycformkey.currentState?.validate() ?? false) {}
                          }),
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
