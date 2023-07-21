import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:open_file_plus/open_file_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';

import 'package:pdf/widgets.dart' as pw;
import 'package:permission_handler/permission_handler.dart';

import '../../../core/contants/appstring_en.dart';

class PDFGenerator {
  generatePDF({
    required String fileName,
    required String zone,
    required String district,
    required String gapa,
    required String wada,
    required String nameofLocalReg,
    required String empRefNo,
    required String regNo,
    required String formRegBSDate,
    required String formRegAdDate,
    required String familyRegNo,
    required String babyFirstName,
    required String babySurName,
    required String babyBS,
    required String babyAd,
    required String palceOfBirth,
    required String helpBy,
    required String gender,
    required String cast,
    required String typeofBirth,
    required String deformity,
    String? deformityValue,
    required String babyDistrict,
    required String babyGapa,
    required String babywada,
    required String abroad,
    required String grandParentFirstName,
    required String grandParentLastName,
    required String fatherName,
    required String fatherSurName,
    required String motherName,
    required String motherSurName,
  }) async {
    final logo = (await rootBundle.load("assets/images/nepal_logo.png"))
        .buffer
        .asUint8List();
    final pdf = pw.Document();
    pdf.addPage(pw.MultiPage(
      pageFormat: PdfPageFormat.a4,
      margin: const pw.EdgeInsets.symmetric(horizontal: 25, vertical: 40),
      build: (context) {
        return [
          pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
            pw.Row(children: [
              pw.Image(pw.MemoryImage(logo), width: 80, height: 80),
              pw.SizedBox(width: 50),
              pw.Column(children: [
                pw.Text(AppString.kathmanduMC,
                    style: pw.TextStyle(
                        fontWeight: pw.FontWeight.bold, fontSize: 20)),
                pw.Text(AppString.cityExe,
                    style: pw.TextStyle(
                        fontWeight: pw.FontWeight.bold, fontSize: 14)),
                pw.Text(AppString.officeLocation,
                    style: pw.TextStyle(
                        fontWeight: pw.FontWeight.bold, fontSize: 14)),
                pw.Text(AppString.birthNotification,
                    style: pw.TextStyle(
                        fontWeight: pw.FontWeight.bold, fontSize: 14))
              ])
            ]),
            pw.SizedBox(height: 5),
            pw.Divider(),

            //to filled by local registar
            pw.Text(AppString.fillByLocalRegistar,
                style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
            pw.SizedBox(height: 5),
            pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Column(children: [
                    pw.Table(border: pw.TableBorder.all(), children: [
                      pw.TableRow(children: [
                        pw.Padding(
                            padding: const pw.EdgeInsets.all(5),
                            child: pw.Text(AppString.zone,
                                style: const pw.TextStyle(fontSize: 10))),
                        pw.Padding(
                            padding: const pw.EdgeInsets.all(5),
                            child: pw.Text(zone,
                                style: const pw.TextStyle(fontSize: 10))),
                      ]),
                      pw.TableRow(children: [
                        pw.Padding(
                            padding: const pw.EdgeInsets.all(5),
                            child: pw.Text(AppString.district,
                                style: const pw.TextStyle(fontSize: 10))),
                        pw.Padding(
                            padding: const pw.EdgeInsets.all(5),
                            child: pw.Text(district,
                                style: const pw.TextStyle(fontSize: 10))),
                      ]),
                      pw.TableRow(children: [
                        pw.Padding(
                            padding: const pw.EdgeInsets.all(5),
                            child: pw.Text(AppString.gaPaNpa,
                                style: const pw.TextStyle(fontSize: 10))),
                        pw.Padding(
                            padding: const pw.EdgeInsets.all(5),
                            child: pw.Text(gapa,
                                style: const pw.TextStyle(fontSize: 10))),
                      ]),
                      pw.TableRow(children: [
                        pw.Padding(
                            padding: const pw.EdgeInsets.all(5),
                            child: pw.Text(AppString.wadaNo,
                                style: const pw.TextStyle(fontSize: 10))),
                        pw.Padding(
                            padding: const pw.EdgeInsets.all(5),
                            child: pw.Text(wada,
                                style: const pw.TextStyle(fontSize: 10))),
                      ]),
                    ])
                  ]),
                  pw.SizedBox(width: 20),

                  //another column for registar
                  pw.Column(children: [
                    pw.Table(border: pw.TableBorder.all(), children: [
                      pw.TableRow(children: [
                        pw.Padding(
                            padding: const pw.EdgeInsets.all(5),
                            child: pw.Text(AppString.nameOfRegistar,
                                style: const pw.TextStyle(fontSize: 10))),
                        pw.Padding(
                            padding: const pw.EdgeInsets.all(5),
                            child: pw.Text(nameofLocalReg,
                                style: const pw.TextStyle(fontSize: 10))),
                      ]),
                      pw.TableRow(children: [
                        pw.Padding(
                            padding: const pw.EdgeInsets.all(5),
                            child: pw.Text(AppString.employeeRefereenceNo,
                                style: const pw.TextStyle(fontSize: 10))),
                        pw.Padding(
                            padding: const pw.EdgeInsets.all(5),
                            child: pw.Text(empRefNo,
                                style: const pw.TextStyle(fontSize: 10))),
                      ]),
                      pw.TableRow(children: [
                        pw.Padding(
                            padding: const pw.EdgeInsets.all(5),
                            child: pw.Text(AppString.registrationNo,
                                style: const pw.TextStyle(fontSize: 10))),
                        pw.Padding(
                            padding: const pw.EdgeInsets.all(5),
                            child: pw.Text(regNo,
                                style: const pw.TextStyle(fontSize: 10))),
                      ]),
                      pw.TableRow(children: [
                        pw.Padding(
                            padding: const pw.EdgeInsets.all(5),
                            child: pw.Text(AppString.registrationDate,
                                style: const pw.TextStyle(fontSize: 10))),
                        pw.Row(children: [
                          pw.Padding(
                              padding: const pw.EdgeInsets.all(5),
                              child: pw.Text("${AppString.bs} : $formRegBSDate",
                                  style: const pw.TextStyle(fontSize: 10))),
                          pw.Text("|", style: const pw.TextStyle(fontSize: 10)),
                          pw.Padding(
                              padding: const pw.EdgeInsets.all(5),
                              child: pw.Text("${AppString.ad} : $formRegAdDate",
                                  style: const pw.TextStyle(fontSize: 10))),
                        ]),
                      ]),
                      pw.TableRow(children: [
                        pw.Padding(
                            padding: const pw.EdgeInsets.all(5),
                            child: pw.Text(AppString.familyregistrationNo,
                                style: const pw.TextStyle(fontSize: 10))),
                        pw.Padding(
                            padding: const pw.EdgeInsets.all(5),
                            child: pw.Text(familyRegNo,
                                style: const pw.TextStyle(fontSize: 10))),
                      ]),
                    ]),
                  ]),
                ]),
            pw.SizedBox(height: 10),
            pw.Text(AppString.dearLocal),
            pw.Row(children: [
              pw.Text(gapa),
              pw.SizedBox(width: 5),
              // pw.Text(AppString.gaPaNpa),
            ]),

            pw.Row(children: [
              pw.Text(district),
              pw.SizedBox(width: 5),
              // pw.Text(AppString.district),
            ]),
            pw.SizedBox(height: 10),
            pw.Text(AppString.sir),
            pw.Text(AppString.iHaveCometoInform),
            pw.SizedBox(height: 10),
            pw.Text("${AppString.one}. ${AppString.detailofNewborn}",
                style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
            pw.SizedBox(height: 10),

            //Child Name
            pw.Row(children: [
              //name
              pw.Text(AppString.name),
              pw.SizedBox(width: 20),
              pw.Table(border: pw.TableBorder.all(), children: [
                pw.TableRow(children: [
                  pw.Padding(
                      padding: const pw.EdgeInsets.symmetric(
                          horizontal: 70, vertical: 5),
                      child: pw.Text(babyFirstName))
                ]),
              ]),

              //surname
              pw.SizedBox(width: 20),
              pw.Text(AppString.surName),
              pw.SizedBox(width: 20),
              pw.Table(border: pw.TableBorder.all(), children: [
                pw.TableRow(children: [
                  pw.Padding(
                      padding: const pw.EdgeInsets.symmetric(
                          horizontal: 70, vertical: 5),
                      child: pw.Text(babySurName))
                ]),
              ])
            ]),

            //DOB
            pw.SizedBox(height: 10),
            pw.Row(children: [
              //BS
              pw.Text("${AppString.dob} : "),
              pw.SizedBox(width: 20),
              pw.Table(border: pw.TableBorder.all(), children: [
                pw.TableRow(children: [
                  pw.Padding(
                      padding: const pw.EdgeInsets.symmetric(
                          horizontal: 50, vertical: 5),
                      child: pw.Text(babyBS))
                ]),
              ]),

              //AD
              pw.SizedBox(width: 20),
              pw.Text(" ${AppString.ad} : "),
              pw.SizedBox(width: 20),
              pw.Table(border: pw.TableBorder.all(), children: [
                pw.TableRow(children: [
                  pw.Padding(
                      padding: const pw.EdgeInsets.symmetric(
                          horizontal: 50, vertical: 5),
                      child: pw.Text(babyAd))
                ]),
              ])
            ]),
            //place of birth
            pw.SizedBox(height: 10),
            pw.Row(children: [
              //BS
              pw.Text("${AppString.placeOfBirth} : "),
              pw.SizedBox(width: 20),
              pw.Table(border: pw.TableBorder.all(), children: [
                pw.TableRow(children: [
                  pw.Padding(
                      padding: const pw.EdgeInsets.symmetric(
                          horizontal: 70, vertical: 5),
                      child: pw.Text(palceOfBirth))
                ]),
              ]),
            ]),

            //Person who help
            pw.SizedBox(height: 10),
            pw.Row(children: [
              pw.Text(" ${AppString.personwhohelpsduringchildbirth} : "),
              pw.SizedBox(width: 20),
              pw.Table(border: pw.TableBorder.all(), children: [
                pw.TableRow(children: [
                  pw.Padding(
                      padding: const pw.EdgeInsets.symmetric(
                          horizontal: 50, vertical: 5),
                      child: pw.Text(helpBy))
                ]),
              ])
            ]),
            pw.SizedBox(height: 10),
            pw.Row(children: [
              //Gender
              pw.Text(" ${AppString.gender}"),
              pw.SizedBox(width: 20),
              pw.Table(border: pw.TableBorder.all(), children: [
                pw.TableRow(children: [
                  pw.Padding(
                      padding: const pw.EdgeInsets.symmetric(
                          horizontal: 50, vertical: 5),
                      child: pw.Text(gender))
                ]),
              ]),

              //cast/race
              pw.SizedBox(width: 20),
              pw.Text(" ${AppString.casteRace}"),
              pw.SizedBox(width: 20),
              pw.Table(border: pw.TableBorder.all(), children: [
                pw.TableRow(children: [
                  pw.Padding(
                      padding: const pw.EdgeInsets.symmetric(
                          horizontal: 70, vertical: 5),
                      child: pw.Text(cast))
                ]),
              ]),
            ]),
            pw.SizedBox(height: 10),
            pw.Row(children: [
              //type of birth

              pw.Text(" ${AppString.typeofBirth}"),
              pw.SizedBox(width: 20),
              pw.Table(border: pw.TableBorder.all(), children: [
                pw.TableRow(children: [
                  pw.Padding(
                      padding: const pw.EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      child: pw.Text(typeofBirth))
                ]),
              ]),

              //Deformity
              pw.SizedBox(width: 20),
              pw.Text(" ${AppString.anyphysicaldeformity}"),
              pw.SizedBox(width: 20),
              pw.Table(border: pw.TableBorder.all(), children: [
                pw.TableRow(children: [
                  pw.Padding(
                      padding: const pw.EdgeInsets.symmetric(
                          horizontal: 30, vertical: 5),
                      child: pw.Text(deformity))
                ]),
              ]),
            ]),
            pw.SizedBox(height: 10),
            deformity == "yes"
                ? pw.Row(
                    children: [
                      pw.Text(" ${AppString.mention}"),
                      pw.SizedBox(width: 20),
                      pw.Table(border: pw.TableBorder.all(), children: [
                        pw.TableRow(children: [
                          pw.Padding(
                              padding: const pw.EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 5),
                              child: pw.Text(deformityValue ?? ""))
                        ]),
                      ]),
                    ],
                  )
                : pw.SizedBox(),
            pw.SizedBox(height: 10),
            pw.Text(AppString.addressofbirth),
            pw.SizedBox(height: 10),
            pw.Row(children: [
              pw.Text(" ${AppString.district}"),
              pw.SizedBox(width: 10),
              pw.Table(border: pw.TableBorder.all(), children: [
                pw.TableRow(children: [
                  pw.Padding(
                      padding: const pw.EdgeInsets.symmetric(
                          horizontal: 30, vertical: 5),
                      child: pw.Text(babyDistrict))
                ]),
              ]),
              pw.SizedBox(width: 20),
              pw.Text(" ${AppString.gaPaNpa}"),
              pw.SizedBox(width: 10),
              pw.Table(border: pw.TableBorder.all(), children: [
                pw.TableRow(children: [
                  pw.Padding(
                      padding: const pw.EdgeInsets.symmetric(
                          horizontal: 30, vertical: 5),
                      child: pw.Text(babyGapa))
                ]),
              ]),
              pw.SizedBox(width: 20),
              pw.Text(" ${AppString.wadaNo}"),
              pw.SizedBox(width: 10),
              pw.Table(border: pw.TableBorder.all(), children: [
                pw.TableRow(children: [
                  pw.Padding(
                      padding: const pw.EdgeInsets.symmetric(
                          horizontal: 30, vertical: 5),
                      child: pw.Text(babywada))
                ]),
              ]),
            ]),
            pw.SizedBox(height: 10),
            pw.Row(children: [
              pw.Text(" ${AppString.addressifbornabroad}"),
              pw.SizedBox(width: 20),
              pw.Table(border: pw.TableBorder.all(), children: [
                pw.TableRow(children: [
                  pw.Padding(
                      padding: const pw.EdgeInsets.symmetric(
                          horizontal: 50, vertical: 5),
                      child: pw.Text(abroad))
                ]),
              ]),
            ]),
            pw.SizedBox(height: 10),
            //Detail of GrandParent
            pw.Text(
                "${AppString.two}. ${AppString.detailsofnewbornbabyparents}",
                style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
            pw.SizedBox(height: 10),
            pw.Row(children: [
              pw.Text(" ${AppString.name}"),
              pw.SizedBox(width: 20),
              pw.Table(border: pw.TableBorder.all(), children: [
                pw.TableRow(children: [
                  pw.Padding(
                      padding: const pw.EdgeInsets.symmetric(
                          horizontal: 50, vertical: 5),
                      child: pw.Text(grandParentFirstName))
                ]),
              ]),
              pw.SizedBox(width: 20),
              pw.Row(children: [
                pw.Text(" ${AppString.surName}"),
                pw.SizedBox(width: 20),
                pw.Table(border: pw.TableBorder.all(), children: [
                  pw.TableRow(children: [
                    pw.Padding(
                        padding: const pw.EdgeInsets.symmetric(
                            horizontal: 50, vertical: 5),
                        child: pw.Text(grandParentLastName))
                  ]),
                ]),
              ]),
            ]),

            pw.SizedBox(height: 40),
            //Detail of parent
            pw.Text(
                "${AppString.three}. ${AppString.detailsofnewbornbabyparents}",
                style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
            pw.SizedBox(height: 10),
            pw.Row(children: [
              pw.Text("${AppString.father} ${AppString.name}"),
              pw.SizedBox(width: 20),
              pw.Table(border: pw.TableBorder.all(), children: [
                pw.TableRow(children: [
                  pw.Padding(
                      padding: const pw.EdgeInsets.symmetric(
                          horizontal: 50, vertical: 5),
                      child: pw.Text(fatherName))
                ]),
              ]),
              pw.SizedBox(width: 20),
              pw.Text("${AppString.father} ${AppString.surName}"),
              pw.SizedBox(width: 20),
              pw.Table(border: pw.TableBorder.all(), children: [
                pw.TableRow(children: [
                  pw.Padding(
                      padding: const pw.EdgeInsets.symmetric(
                          horizontal: 50, vertical: 5),
                      child: pw.Text(fatherSurName))
                ]),
              ]),
            ]),
            pw.SizedBox(height: 10),
            pw.Row(children: [
              pw.Text("${AppString.mothe} ${AppString.name}"),
              pw.SizedBox(width: 20),
              pw.Table(border: pw.TableBorder.all(), children: [
                pw.TableRow(children: [
                  pw.Padding(
                      padding: const pw.EdgeInsets.symmetric(
                          horizontal: 50, vertical: 5),
                      child: pw.Text(motherName))
                ]),
              ]),
              pw.SizedBox(width: 20),
              pw.Text("${AppString.mothe} ${AppString.surName}"),
              pw.SizedBox(width: 20),
              pw.Table(border: pw.TableBorder.all(), children: [
                pw.TableRow(children: [
                  pw.Padding(
                      padding: const pw.EdgeInsets.symmetric(
                          horizontal: 50, vertical: 5),
                      child: pw.Text(motherSurName))
                ]),
              ]),
            ])
          ])
        ];
      },
    ));
    await savePDF(fileName, pdf);
  }
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
