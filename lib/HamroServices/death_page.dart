import 'dart:convert';
import 'dart:io';

import 'package:e_woda/Kyc%20Update/GenderTypes/gendertype_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:open_file_plus/open_file_plus.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import '../Common/custom_appbar.dart';
import '../Common/custom_snackbar.dart';
import '../Common/custom_textformfield.dart';
import '../Kyc Update/RelationGroup/relationtype_page.dart';
import 'package:http/http.dart' as http;

import '../features/authentication/User Login Page/login_user_page.dart';
import 'KYC_Status.dart';

class DeathPage extends StatefulWidget {
  const DeathPage({super.key});

  @override
  State<DeathPage> createState() => _DeathPageState();
}

class _DeathPageState extends State<DeathPage> {
  void initState() {
    super.initState();
    checkStatus();
  }

  final deathformkey = GlobalKey<FormState>();
  final deathbirthController = TextEditingController();
  final deathplaceofdeathController = TextEditingController();
  final deathcauseController = TextEditingController();
  final deathdateController = TextEditingController();
  final deathfirstnameController = TextEditingController();
  final deathmiddlenameController = TextEditingController();
  final deathlastnameController = TextEditingController();
  bool? deathregistersuccess;

  Future<void> postData() async {
    deathregistersuccess = false;
    final response = await http.post(
        Uri.parse(
            "https://hedgehog-ready-daily.ngrok-free.app/api/app/death-registration"),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Accept': '*/*',
        },
        body: jsonEncode(
          <String, dynamic>{
            "userId": UserId,
            "birthDate": deathbirthController.text,
            "genderId": selectedGenderId,
            "placeOfDeath": deathplaceofdeathController.text,
            "causeOfDeath": deathcauseController.text,
            "deathTime": deathdateController.text,
            "personFirstName": deathfirstnameController.text,
            "personMiddleName": deathmiddlenameController.text,
            "personLastName": deathlastnameController.text,
            "relationId": selectedRelationId
          },
        ));
    deathregistersuccess = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(60.0),
            child: NavigateAppBar(title: "Death Register Page")),
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
                  key: deathformkey,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 30.0),
                        CustomTextFormField(
                          hintText: "Date ofBirth in yy-mm-dd format",
                          textController: deathbirthController,
                          validate: ((value) {
                            return null;
                          }),
                        ),
                        const SizedBox(height: 30.0),
                        Text("Select Gender Types"),
                        GenderTypeDropDownButton(),
                        SizedBox(height: 20.0),
                        CustomTextFormField(
                          hintText: "Place of Death",
                          textController: deathplaceofdeathController,
                          validate: ((value) {
                            final nameRegex = RegExp(
                                r"^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$");
                            if (!nameRegex.hasMatch(value.toString())) {
                              return "Deathplace cannot be null";
                            }
                            return null;
                          }),
                        ),
                        const SizedBox(height: 30.0),
                        CustomTextFormField(
                          hintText: "Cause of death",
                          textController: deathcauseController,
                          validate: ((value) {
                            final nameRegex = RegExp(
                                r"^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$");
                            if (!nameRegex.hasMatch(value.toString())) {
                              return "Cause of death Cannot be null";
                            }
                            return null;
                          }),
                        ),
                        const SizedBox(height: 30.0),
                        CustomTextFormField(
                          hintText: "Death date in yy-mm-dd format",
                          textController: deathdateController,
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
                        const SizedBox(height: 20.0),
                        CustomTextFormField(
                          hintText: "Person First Name",
                          textController: deathfirstnameController,
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
                          hintText: "Person Middle Name",
                          textController: deathmiddlenameController,
                          validate: ((value) {
                            return null;
                          }),
                        ),
                        const SizedBox(height: 30.0),
                        CustomTextFormField(
                          hintText: "Person Last Name",
                          textController: deathlastnameController,
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
                        Text("Select Relation Type"),
                        RelationDropDownButton(),
                        SizedBox(height: 20.0),
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
                                    if (deathformkey.currentState!.validate()) {
                                      postData().whenComplete(() {
                                        if (deathregistersuccess!) {
                                          generatedeathpdf(
                                              deathbirthController.text,
                                              selectedGenderValue,
                                              deathplaceofdeathController.text,
                                              deathcauseController.text,
                                              deathdateController.text,
                                              deathfirstnameController.text,
                                              deathmiddlenameController.text,
                                              deathlastnameController.text);
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
                                        "Death Register",
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
  }
}

Future<void> generatedeathpdf(
    @required birthdate,
    @required gendertype,
    @required placeofdeath,
    @required causeofdeath,
    @required deathdate,
    @required personfirstname,
    @required personmiddlename,
    @required personlastname) async {
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
                pw.Text("Death Regristration",
                    style: pw.TextStyle(
                        fontWeight: pw.FontWeight.bold, fontSize: 25))
              ])
            ]),
            pw.SizedBox(height: 40.0),
            pw.Row(children: [
              //BS
              pw.Text(
                "Date of Birth: ",
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
                      child: pw.Text(birthdate),
                    ),
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
                "Place of death : ",
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
                        child: pw.Text(placeofdeath))
                  ],
                ),
              ]),
            ]),
            pw.SizedBox(height: 20.0),
            pw.Row(children: [
              //BS
              pw.Text(
                "Cause of Death : ",
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
                        child: pw.Text(causeofdeath))
                  ],
                ),
              ]),
            ]),
            pw.SizedBox(height: 20.0),
            pw.Row(children: [
              //BS
              pw.Text(
                "Death Date ",
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
                        child: pw.Text(deathdate))
                  ],
                ),
              ]),
            ]),
            pw.SizedBox(height: 20.0),
            pw.Row(children: [
              //BS
              pw.Text(
                "Person First Name ",
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
                        child: pw.Text(personfirstname))
                  ],
                ),
              ]),
            ]),
            pw.SizedBox(height: 20.0),
            pw.Row(children: [
              //BS
              pw.Text(
                "Person Middle Name:-",
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
                        child: pw.Text(personmiddlename))
                  ],
                ),
              ]),
            ]),
            pw.SizedBox(height: 20.0),
            pw.Row(children: [
              //BS
              pw.Text(
                "Person Lastname ",
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
                        child: pw.Text(personlastname))
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
