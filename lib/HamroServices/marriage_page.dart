import 'dart:convert';
import 'dart:io';

import 'package:e_woda/Kyc%20Update/RelationGroup/relationtype_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:permission_handler/permission_handler.dart';
import 'package:open_file_plus/open_file_plus.dart';

import '../Common/custom_appbar.dart';
import '../Common/custom_textformfield.dart';
import '../features/authentication/User Login Page/login_user_page.dart';
import 'KYC_Status.dart';
import 'marriage_relation_dropdown.dart';
import 'package:http/http.dart' as http;

class MarriagePage extends StatefulWidget {
  const MarriagePage({super.key});

  @override
  State<MarriagePage> createState() => _MarriagePageState();
}

class _MarriagePageState extends State<MarriagePage> {
  void initState() {
    super.initState();
    checkStatus();
  }

  bool? marriageregistersuccess;

  Future<void> postData() async {
    Logger().e("Button is pressed");
    marriageregistersuccess = false;
    final response = await http.post(
        Uri.parse(
            "https://hedgehog-ready-daily.ngrok-free.app/api/app/marriage-registration"),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Accept': '*/*',
        },
        body: jsonEncode(
          <String, dynamic>{
            "userId": UserId,
            "husbandFirstName": husbandfirstnameController.text,
            "husbandMiddleName": husbandmiddlenameController.text,
            "husbandLastName": husbandsurnameController.text,
            "husbandBirthDate": husbandbirthdateController.text,
            "wifeFirstName": wifefirstnameController.text,
            "wifeMiddleName": wifemiddlenameController.text,
            "wifeLastName": wifesurnameController.text,
            "wifeBirthDate": wifebirthdateController.text,
            "marriageType": marriageSelectedValue,
            "placeOfMarriage": placeofmarriageController.text,
            "dateOfMarriage": marriagedateController.text,
            "marriageRegistrar": marriageregistererController.text,
            "relationId": selectedRelationId
          },
        ));
    Logger().e(response.body);
    marriageregistersuccess = true;
  }

  final marriageformkey = GlobalKey<FormState>();
  final husbandfirstnameController = TextEditingController();
  final husbandmiddlenameController = TextEditingController();
  final husbandsurnameController = TextEditingController();
  final husbandbirthdateController = TextEditingController();

  final wifefirstnameController = TextEditingController();
  final wifemiddlenameController = TextEditingController();
  final wifesurnameController = TextEditingController();
  final wifebirthdateController = TextEditingController();
  final placeofmarriageController = TextEditingController();
  final marriagedateController = TextEditingController();
  final marriageregistererController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(60.0),
            child: NavigateAppBar(title: "Marriage Register Page")),
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
                  key: marriageformkey,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 30.0),
                        CustomTextFormField(
                          hintText: "Husband First Name",
                          textController: husbandfirstnameController,
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
                          hintText: "Husband Middle Name",
                          textController: husbandmiddlenameController,
                          validate: ((value) {
                            return null;
                          }),
                        ),
                        const SizedBox(height: 30.0),
                        CustomTextFormField(
                          hintText: "Husband Last Name",
                          textController: husbandsurnameController,
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
                          hintText: "Date of Birth of Husband in yy-mm-dd",
                          textController: husbandbirthdateController,
                          validate: ((value) {
                            return null;
                          }),
                        ),
                        const SizedBox(height: 30.0),
                        CustomTextFormField(
                          hintText: "Wife First Name",
                          textController: wifefirstnameController,
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
                          hintText: "Wife Middle Name",
                          textController: wifemiddlenameController,
                          validate: ((value) {
                            return null;
                          }),
                        ),
                        const SizedBox(height: 30.0),
                        CustomTextFormField(
                          hintText: "Wife Last Name",
                          textController: wifesurnameController,
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
                          hintText: "Date of Birth of Wife in yy-mm-dd",
                          textController: wifebirthdateController,
                          validate: ((value) {
                            return null;
                          }),
                        ),
                        SizedBox(height: 30.0),
                        MarriageTypeDropDown(),
                        SizedBox(height: 20.0),
                        CustomTextFormField(
                          hintText: "Place of marriage",
                          textController: placeofmarriageController,
                          validate: ((value) {
                            final nameRegex = RegExp(
                                r"^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$");
                            if (!nameRegex.hasMatch(value.toString())) {
                              return "Birthplace should be given";
                            }
                            return null;
                          }),
                        ),
                        SizedBox(height: 30.0),
                        CustomTextFormField(
                          hintText: "Date of Marriage in yy-mm-dd",
                          textController: marriagedateController,
                          validate: ((value) {
                            return null;
                          }),
                        ),
                        const SizedBox(height: 20.0),
                        CustomTextFormField(
                          hintText: "Person who register this marriage",
                          textController: marriageregistererController,
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
                                    if (marriageformkey.currentState!
                                        .validate()) {
                                      postData().whenComplete(() {
                                        if (marriageregistersuccess!) {
                                          Navigator.pop(context);
                                          generatemarriagepdf(
                                              husbandfirstnameController.text,
                                              husbandmiddlenameController.text,
                                              husbandsurnameController.text,
                                              husbandbirthdateController.text,
                                              wifefirstnameController.text,
                                              wifemiddlenameController.text,
                                              wifesurnameController.text,
                                              wifebirthdateController.text,
                                              marriagedateController.text,
                                              placeofmarriageController.text,
                                              marriageSelectedValue);
                                        }
                                      });
                                    }
                                  },
                                  child: SizedBox(
                                      height: 50,
                                      child: Center(
                                          child: Text(
                                        "Marriage Register",
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

Future<void> generatemarriagepdf(
    @required husbandfirstname,
    @required husbandmiddlename,
    @required husbandlastname,
    @required husbandbirthdate,
    @required wifefirstname,
    @required wifemiddlename,
    @required wifelastname,
    @required wifebirthdate,
    @required marriagedate,
    @required marriageplace,
    @required marriagetype) async {
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
                pw.Text("Marriage Regristration",
                    style: pw.TextStyle(
                        fontWeight: pw.FontWeight.bold, fontSize: 25))
              ])
            ]),
            pw.SizedBox(height: 40.0),
            pw.Text(
              "Husband details",
              style: pw.TextStyle(
                fontSize: 18.0,
                fontWeight: pw.FontWeight.bold,
              ),
            ),
            pw.SizedBox(height: 10.0),
            pw.Row(children: [
              //BS
              pw.Text(
                "Husband name : ",
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
                      child: pw.Text(husbandfirstname),
                    ),
                  ],
                ),
              ]),
            ]),
            pw.SizedBox(height: 20.0),
            pw.Row(children: [
              //BS
              pw.Text(
                "Husband Middle Name : ",
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
                        child: pw.Text(husbandmiddlename))
                  ],
                ),
              ]),
            ]),
            pw.SizedBox(height: 20.0),
            pw.Row(children: [
              //BS
              pw.Text(
                "Husband Last Name : ",
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
                        child: pw.Text(husbandlastname))
                  ],
                ),
              ]),
            ]),
            pw.SizedBox(height: 20.0),
            pw.Row(children: [
              //BS
              pw.Text(
                "Husband Birth Date : ",
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
                        child: pw.Text(husbandbirthdate))
                  ],
                ),
              ]),
            ]),
            pw.SizedBox(height: 20.0),
            pw.Text(
              "Wife details",
              style: pw.TextStyle(
                fontSize: 18.0,
                fontWeight: pw.FontWeight.bold,
              ),
            ),
            pw.SizedBox(height: 10.0),
            pw.Row(children: [
              //BS
              pw.Text(
                "Wife First name : ",
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
                      child: pw.Text(wifefirstname),
                    ),
                  ],
                ),
              ]),
            ]),
            pw.SizedBox(height: 20.0),
            pw.Row(children: [
              //BS
              pw.Text(
                "Wife Middle Name : ",
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
                        child: pw.Text(wifemiddlename))
                  ],
                ),
              ]),
            ]),
            pw.SizedBox(height: 20.0),
            pw.Row(children: [
              //BS
              pw.Text(
                "Wife Last Name : ",
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
                        child: pw.Text(wifelastname))
                  ],
                ),
              ]),
            ]),
            pw.SizedBox(height: 20.0),
            pw.Row(children: [
              //BS
              pw.Text(
                "Wife Birth Date : ",
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
                        child: pw.Text(wifebirthdate))
                  ],
                ),
              ]),
            ]),
            pw.SizedBox(height: 20.0),
            pw.Text(
              "Marriage details",
              style: pw.TextStyle(
                fontSize: 18.0,
                fontWeight: pw.FontWeight.bold,
              ),
            ),
            pw.SizedBox(height: 10.0),
            pw.Row(children: [
              //BS
              pw.Text(
                "Marriage Place : ",
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
                        child: pw.Text(marriageplace))
                  ],
                ),
              ]),
            ]),
            pw.SizedBox(height: 20.0),
            pw.Row(children: [
              //BSma
              pw.Text(
                "Marriage Date ",
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
                        child: pw.Text(marriagedate))
                  ],
                ),
              ]),
            ]),
            pw.SizedBox(height: 20.0),
            pw.Row(children: [
              //BS
              pw.Text(
                "Marriage Types:-",
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
                        child: pw.Text(marriagetype))
                  ],
                ),
              ]),
            ]),
          ]),
        ]),
      ),
    ),
  );

  await savePDF("marriage.pdf", pdf);
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
