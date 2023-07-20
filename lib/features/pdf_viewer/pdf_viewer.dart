import 'package:e_woda/respository/pdf_downloader.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PDFViewer extends StatelessWidget {
  const PDFViewer({super.key, required this.url});
  final String url;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.blue,
        actions: [
          TextButton.icon(
              onPressed: () async {
                await downloadFile(url, "BirthInfoForm");
              },
              icon: const Icon(
                Icons.download,
                color: Colors.black,
              ),
              label: const Text(
                "Download",
                style: TextStyle(color: Colors.black),
              ))
        ],
      ),
      body: SfPdfViewer.network(
        url,
        enableDocumentLinkAnnotation: false,
      ),
    );
  }
}
