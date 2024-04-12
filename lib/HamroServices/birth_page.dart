// ignore_for_file: use_build_context_synchronously, unused_local_variable, prefer_const_declarations, invalid_required_positional_param, prefer_const_constructors

import 'dart:convert';
import 'dart:io';

import 'package:e_woda/Common/custom_appbar.dart';
import 'package:e_woda/Common/custom_snackbar.dart';

import 'package:e_woda/Common/custom_textformfield.dart';
import 'package:e_woda/HamroServices/KYC_Status.dart';
import 'package:e_woda/Kyc%20Update/RelationGroup/relationtype_page.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';
import 'package:open_file_plus/open_file_plus.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

import 'package:permission_handler/permission_handler.dart';

import '../Kyc Update/GenderTypes/gendertype_page.dart';
import '../features/authentication/User Login Page/login_user_page.dart';

class BirthPage extends StatefulWidget {
  BirthPage({super.key});

  @override
  State<BirthPage> createState() => _BirthPageState();
}

class _BirthPageState extends State<BirthPage> {
  void initState() {
    super.initState();
    checkStatus();
  }

  final birthfirstnameController = TextEditingController();

  final birthmiddlenameController = TextEditingController();

  final birthsurnameController = TextEditingController();

  final birthdateController = TextEditingController();

  final birthplaceController = TextEditingController();

  final birthfatherfirstnameController = TextEditingController();

  final birthfathermiddlenameController = TextEditingController();

  final birthfathersurnameCOntroller = TextEditingController();

  final birthmotherfirstnameController = TextEditingController();

  final birthmothermiddlenameController = TextEditingController();

  final birthmothersurnameCOntroller = TextEditingController();

  final birthformkey = GlobalKey<FormState>();

  bool? birthregistersuccess;

  Future<void> postData() async {
    birthregistersuccess = false;
    final response = await http.post(
        Uri.parse(
            "https://hedgehog-ready-daily.ngrok-free.app/api/app/birth-registration"),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Accept': '*/*',
        },
        body: jsonEncode(
          <String, dynamic>{
            "childFirstName": birthfirstnameController.text,
            "childMiddleName": birthmiddlenameController.text ?? "",
            "childLastName": birthsurnameController.text,
            "birthDate": birthdateController.text,
            "placeOfBirth": birthplaceController.text,
            "genderId": selectedGenderId,
            "fatherFirstName": birthfatherfirstnameController.text,
            "fatherMiddleName": birthfathermiddlenameController.text ?? "",
            "fatherLastName": birthfathersurnameCOntroller.text,
            "motherFirstName": birthmotherfirstnameController.text,
            "motherMiddleName": birthmothermiddlenameController.text ?? "",
            "motherLastName": birthmothersurnameCOntroller.text,
            "relationId": selectedRelationId,
            "userId": UserId
          },
        ));
    birthregistersuccess = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(60.0),
            child: NavigateAppBar(title: "Birth Register Page")),
        body: SingleChildScrollView(
          child: Column(
            children: [
              if (UserStatus == 'Pending')
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 20, 0, 0),
                  child: Text(
                    'Kyc status is pending you cannot submit the form',
                    style: TextStyle(color: Colors.red, fontSize: 15),
                  ),
                ),
              if (UserStatus != 'Accepted' && UserStatus != "Pending")
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 20, 0, 0),
                  child: Text(
                    'First fill the kyc update form',
                    style: TextStyle(color: Colors.red, fontSize: 20),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: birthformkey,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 30.0),
                        CustomTextFormField(
                          hintText: "Child First Name",
                          textController: birthfirstnameController,
                          validate: ((value) {
                            final nameRegex = RegExp(
                                r"^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$");
                            if (!nameRegex.hasMatch(value.toString())) {
                              return "Name Field cannot be empty";
                            }
                            return null;
                          }),
                        ),
                        const SizedBox(height: 30.0),
                        CustomTextFormField(
                          hintText: "Child Middle Name",
                          textController: birthmiddlenameController,
                          validate: ((value) {
                            return null;
                          }),
                        ),
                        const SizedBox(height: 30.0),
                        CustomTextFormField(
                          hintText: "Child Last Name",
                          textController: birthsurnameController,
                          validate: ((value) {
                            final nameRegex = RegExp(
                                r"^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$");
                            if (!nameRegex.hasMatch(value.toString())) {
                              return "Surname Cannot be null";
                            }
                            return null;
                          }),
                        ),
                        const SizedBox(height: 30.0),
                        CustomTextFormField(
                          hintText: "Date of Birth in yy-mm-dd format",
                          textController: birthdateController,
                          validate: ((value) {
                            // final nameRegex = RegExp(
                            //     r"^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$");
                            // if (!nameRegex.hasMatch(value.toString())) {
                            //   return AppLocalizations.of(context)!.usernamevalidate;
                            // }
                            return null;
                          }),
                        ),
                        SizedBox(height: 30.0),
                        CustomTextFormField(
                          hintText: "BirthPlace",
                          textController: birthplaceController,
                          validate: ((value) {
                            final nameRegex = RegExp(
                                r"^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$");
                            if (!nameRegex.hasMatch(value.toString())) {
                              return "Birthplace should be given";
                            }
                            return null;
                          }),
                        ),
                        Text("Gender Types"),
                        GenderTypeDropDownButton(),
                        const SizedBox(height: 20.0),
                        CustomTextFormField(
                          hintText: "Father First Name",
                          textController: birthfatherfirstnameController,
                          validate: ((value) {
                            final nameRegex = RegExp(
                                r"^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$");
                            if (!nameRegex.hasMatch(value.toString())) {
                              return "Name cannot be null ";
                            }
                            return null;
                          }),
                        ),
                        const SizedBox(height: 30.0),
                        CustomTextFormField(
                          hintText: "Father Middle Name",
                          textController: birthfathermiddlenameController,
                          validate: ((value) {
                            return null;
                          }),
                        ),
                        const SizedBox(height: 30.0),
                        CustomTextFormField(
                          hintText: "Father Last Name",
                          textController: birthfathersurnameCOntroller,
                          validate: ((value) {
                            final nameRegex = RegExp(
                                r"^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$");
                            if (!nameRegex.hasMatch(value.toString())) {
                              return "Surname cannot be empty";
                            }
                            return null;
                          }),
                        ),
                        const SizedBox(height: 30.0),
                        CustomTextFormField(
                          hintText: "Mother First Name",
                          textController: birthmotherfirstnameController,
                          validate: ((value) {
                            final nameRegex = RegExp(
                                r"^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$");
                            if (!nameRegex.hasMatch(value.toString())) {
                              return "Mother Name cannot be empty";
                            }
                            return null;
                          }),
                        ),
                        const SizedBox(height: 30.0),
                        CustomTextFormField(
                          hintText: "Mother Middle Name",
                          textController: birthmothermiddlenameController,
                          validate: ((value) {
                            return null;
                          }),
                        ),
                        const SizedBox(height: 30.0),
                        CustomTextFormField(
                          hintText: "Mother Last Name",
                          textController: birthmothersurnameCOntroller,
                          validate: ((value) {
                            final nameRegex = RegExp(
                                r"^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$");
                            if (!nameRegex.hasMatch(value.toString())) {
                              return "Surname cannot be empty";
                            }
                            return null;
                          }),
                        ),
                        Text("Select Relation Type"),
                        RelationDropDownButton(),
                        if (UserStatus == "Accepted")
                          Row(
                            children: [
                              Spacer(),
                              TextButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStatePropertyAll(
                                        Colors.blue.shade200),
                                  ),
                                  onPressed: () {
                                    Logger().e(UserId);
                                    if (birthformkey.currentState!.validate()) {
                                      postData().whenComplete(() {
                                        if (birthregistersuccess == true) {
                                          generatepdf(
                                              birthfirstnameController.text,
                                              birthmiddlenameController.text ??
                                                  "",
                                              birthsurnameController.text,
                                              birthdateController.text,
                                              birthplaceController.text,
                                              birthfatherfirstnameController.text ??
                                                  "",
                                              birthfathermiddlenameController
                                                  .text,
                                              birthfathersurnameCOntroller.text,
                                              birthmotherfirstnameController
                                                  .text,
                                              birthmothermiddlenameController
                                                      .text ??
                                                  "",
                                              birthmothersurnameCOntroller.text,
                                              selectedGenderValue);
                                        } else {
                                          customSnackbar(context,
                                              "Something went wrong Please try again");
                                        }
                                      });
                                    }
                                    ;
                                  },
                                  child: SizedBox(
                                      height: 50,
                                      child: Center(
                                          child: Text(
                                        "Birth Register",
                                        style: TextStyle(color: Colors.white),
                                      )))),
                              Spacer(),
                            ],
                          ),
                      ]),
                ),
              ),
            ],
          ),
        ));
    // ignore: dead_code
  }
}

// ignore: invalid_required_positional_param
Future<void> generatepdf(
    @required firstname,
    @required middlename,
    @required lastname,
    @required birthdate,
    @required birthplace,
    @required fatherfirstname,
    @required fathermiddlename,
    @required fatherlastname,
    @required motherfirstname,
    @required mothermiddlename,
    @required motherlastname,
    @required gendertype) async {
  final logo = (await rootBundle.load("assets/images/digitalgaue.png"))
      .buffer
      .asUint8List();
  final pdf = pw.Document();

  pdf.addPage(
    pw.Page(
      build: (pw.Context context) => pw.Center(
        child: pw.Column(children: [
          pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
            pw.Row(children: [
              pw.Image(pw.MemoryImage(logo), width: 80, height: 80),
              pw.SizedBox(width: 50),
              pw.Column(children: [
                pw.Text("Nagarjuna",
                    style: pw.TextStyle(
                        fontWeight: pw.FontWeight.bold, fontSize: 20)),
                pw.Text("Kathmandu",
                    style: pw.TextStyle(
                        fontWeight: pw.FontWeight.bold, fontSize: 14)),
                pw.Text("Kathmandu-07",
                    style: pw.TextStyle(
                        fontWeight: pw.FontWeight.bold, fontSize: 14)),
                pw.Text("Birth Regristration",
                    style: pw.TextStyle(
                        fontWeight: pw.FontWeight.bold, fontSize: 25))
              ])
            ]),
            pw.SizedBox(height: 40.0),
            pw.Row(children: [
              //BS
              pw.Text(
                "Child Name : ",
                style: pw.TextStyle(
                  fontSize: 14.0,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
              pw.SizedBox(width: 20),
              pw.Table(border: pw.TableBorder.all(), children: [
                pw.TableRow(
                  children: [
                    pw.Padding(
                      padding: const pw.EdgeInsets.symmetric(
                          horizontal: 50, vertical: 5),
                      child: pw.Text(firstname),
                    ),
                  ],
                ),
              ]),
            ]),
            pw.SizedBox(height: 20.0),
            pw.Row(children: [
              //BS
              pw.Text(
                "Child Middle Name : ",
                style: pw.TextStyle(
                  fontSize: 14.0,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
              pw.SizedBox(width: 20),
              pw.Table(border: pw.TableBorder.all(), children: [
                pw.TableRow(
                  children: [
                    pw.Padding(
                        padding: const pw.EdgeInsets.symmetric(
                            horizontal: 50, vertical: 5),
                        child: pw.Text(middlename))
                  ],
                ),
              ]),
            ]),
            pw.SizedBox(height: 20.0),
            pw.Row(children: [
              //BS
              pw.Text(
                "Child Last Name : ",
                style: pw.TextStyle(
                  fontSize: 14.0,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
              pw.SizedBox(width: 20),
              pw.Table(border: pw.TableBorder.all(), children: [
                pw.TableRow(
                  children: [
                    pw.Padding(
                        padding: const pw.EdgeInsets.symmetric(
                            horizontal: 50, vertical: 5),
                        child: pw.Text(lastname))
                  ],
                ),
              ]),
            ]),
            pw.SizedBox(height: 20.0),
            pw.Row(children: [
              //BS
              pw.Text(
                "Birth Date : ",
                style: pw.TextStyle(
                  fontSize: 14.0,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
              pw.SizedBox(width: 20),
              pw.Table(border: pw.TableBorder.all(), children: [
                pw.TableRow(
                  children: [
                    pw.Padding(
                        padding: const pw.EdgeInsets.symmetric(
                            horizontal: 50, vertical: 5),
                        child: pw.Text(birthdate))
                  ],
                ),
              ]),
            ]),
            pw.SizedBox(height: 20.0),
            pw.Row(children: [
              //BS
              pw.Text(
                "Gender Type : ",
                style: pw.TextStyle(
                  fontSize: 14.0,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
              pw.SizedBox(width: 20),
              pw.Table(border: pw.TableBorder.all(), children: [
                pw.TableRow(
                  children: [
                    pw.Padding(
                        padding: const pw.EdgeInsets.symmetric(
                            horizontal: 50, vertical: 5),
                        child: pw.Text(gendertype))
                  ],
                ),
              ]),
            ]),
            pw.SizedBox(height: 20.0),
            pw.Row(children: [
              //BS
              pw.Text(
                "Birth Place : ",
                style: pw.TextStyle(
                  fontSize: 14.0,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
              pw.SizedBox(width: 20),
              pw.Table(border: pw.TableBorder.all(), children: [
                pw.TableRow(
                  children: [
                    pw.Padding(
                        padding: const pw.EdgeInsets.symmetric(
                            horizontal: 50, vertical: 5),
                        child: pw.Text(birthplace))
                  ],
                ),
              ]),
            ]),
            pw.SizedBox(height: 20.0),
            pw.Row(children: [
              //BS
              pw.Text(
                "Father First Name ",
                style: pw.TextStyle(
                  fontSize: 14.0,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
              pw.SizedBox(width: 20),
              pw.Table(border: pw.TableBorder.all(), children: [
                pw.TableRow(
                  children: [
                    pw.Padding(
                        padding: const pw.EdgeInsets.symmetric(
                            horizontal: 50, vertical: 5),
                        child: pw.Text(fatherfirstname))
                  ],
                ),
              ]),
            ]),
            pw.SizedBox(height: 20.0),
            pw.Row(children: [
              //BS
              pw.Text(
                "Father Middle Name:-",
                style: pw.TextStyle(
                  fontSize: 14.0,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
              pw.SizedBox(width: 20),
              pw.Table(border: pw.TableBorder.all(), children: [
                pw.TableRow(
                  children: [
                    pw.Padding(
                        padding: const pw.EdgeInsets.symmetric(
                            horizontal: 50, vertical: 5),
                        child: pw.Text(fathermiddlename))
                  ],
                ),
              ]),
            ]),
            pw.SizedBox(height: 20.0),
            pw.Row(children: [
              //BS
              pw.Text(
                "Father Surname ",
                style: pw.TextStyle(
                  fontSize: 14.0,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
              pw.SizedBox(width: 20),
              pw.Table(border: pw.TableBorder.all(), children: [
                pw.TableRow(
                  children: [
                    pw.Padding(
                        padding: const pw.EdgeInsets.symmetric(
                            horizontal: 50, vertical: 5),
                        child: pw.Text(fatherlastname))
                  ],
                ),
              ]),
            ]),
            pw.SizedBox(height: 20.0),
            pw.Row(children: [
              //BS
              pw.Text(
                "Mother First Name : ",
                style: pw.TextStyle(
                  fontSize: 14.0,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
              pw.SizedBox(width: 20),
              pw.Table(border: pw.TableBorder.all(), children: [
                pw.TableRow(
                  children: [
                    pw.Padding(
                        padding: const pw.EdgeInsets.symmetric(
                            horizontal: 50, vertical: 5),
                        child: pw.Text(motherfirstname))
                  ],
                ),
              ]),
            ]),
            pw.SizedBox(height: 20.0),
            pw.Row(children: [
              //BS
              pw.Text(
                "Mother Middle Name: ",
                style: pw.TextStyle(
                  fontSize: 14.0,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
              pw.SizedBox(width: 20),
              pw.Table(border: pw.TableBorder.all(), children: [
                pw.TableRow(
                  children: [
                    pw.Padding(
                        padding: const pw.EdgeInsets.symmetric(
                            horizontal: 50, vertical: 5),
                        child: pw.Text(mothermiddlename))
                  ],
                ),
              ]),
            ]),
            pw.SizedBox(height: 20.0),
            pw.Row(children: [
              //BS
              pw.Text(
                "MotherLastName :",
                style: pw.TextStyle(
                  fontSize: 14.0,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
              pw.SizedBox(width: 20),
              pw.Table(border: pw.TableBorder.all(), children: [
                pw.TableRow(
                  children: [
                    pw.Padding(
                        padding: const pw.EdgeInsets.symmetric(
                            horizontal: 50, vertical: 5),
                        child: pw.Text(motherlastname))
                  ],
                ),
              ]),
            ]),
          ]),
        ]),
      ),
    ),
  );

  await savePDF("example.pdf", pdf);
}

savePDF(String fileName, pw.Document pdf) async {
  if (Platform.isIOS) {
    try {
      final output = await getApplicationDocumentsDirectory();
      var filePath =
          "${output.path}/$fileName ${(DateTime.now().microsecondsSinceEpoch)}.pdf";
      final file = File(filePath);
      if (await file.exists()) {
        await file.delete();
      }
      await file
          .writeAsBytes(await pdf.save())
          .then((value) => OpenFile.open(filePath));
    } on PlatformException catch (e) {
      debugPrint(e.toString());
    }
  } else {
    try {
      Directory? directory;
      directory = await getExternalStorageDirectory();

      if (await Permission.storage.request().isGranted) {
        try {
          var filePath =
              "${directory!.path}/$fileName ${(DateTime.now().microsecondsSinceEpoch)}.pdf";
          final file = File(filePath);
          debugPrint(file.path);
          if (await file.exists()) {
            await file.delete();
          }
          await file
              .writeAsBytes(await pdf.save())
              .then((value) => OpenFile.open(filePath));
        } on Exception catch (e) {
          debugPrint(e.toString());
        }
      } else {
        await Permission.storage.request();
      }
    } on PlatformException catch (e) {
      debugPrint(e.toString());
    }
  }
}
