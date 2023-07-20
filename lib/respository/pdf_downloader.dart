import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

Future<String> downloadFile(String url, String fileName) async {
  HttpClient httpClient = HttpClient();
  File file;
  String filePath = '';

  try {
    var request = await httpClient.getUrl(Uri.parse(url));
    var response = await request.close();
    if (response.statusCode == 200) {
      var bytes = await consolidateHttpClientResponseBytes(response);

      if (Platform.isIOS) {
        final output = await getApplicationDocumentsDirectory();
        filePath = '$output/$fileName.pdf';
        file = File(filePath);
        await file.writeAsBytes(bytes);
      } else {
        Directory? directory = await getExternalStorageDirectory();
        if (await Permission.storage.request().isGranted) {
          var filePath = "${directory!.path}/$fileName.pdf";
          final file = File(filePath);
          await file.writeAsBytes(bytes);
        } else {
          await Permission.storage.request();
        }
      }
    } else {
      filePath = 'Error code: ${response.statusCode}';
    }
  } catch (ex) {
    filePath = 'Can not fetch url';
  }

  return filePath;
}
