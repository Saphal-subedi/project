import 'package:e_woda/Common/custom_snackbar.dart';

import 'package:e_woda/Common/loading_indicator.dart';
import 'package:e_woda/provider/loading_provider.dart';
import 'package:e_woda/respository/pdf_downloader.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PDFViewer extends StatelessWidget {
  PDFViewer({super.key, required this.url});
  final String url;
  final PdfViewerController controller = PdfViewerController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.blue,
        actions: [
          Consumer<LoadinProvider>(builder: ((context, value, child) {
            if (value.isLoading) {
              return const CustomLoadingIndicator();
            } else {
              return TextButton.icon(
                  onPressed: () async {
                    value.setLoading(true);
                    await downloadFile(url, "BirthInfoForm");

                    value.setLoading(false);
                    // ignore: use_build_context_synchronously
                    customSnackbar(context, "Pdf downloaded");
                  },
                  icon: const Icon(
                    Icons.download,
                    color: Colors.black,
                  ),
                  label: const Text(
                    "Download",
                    style: TextStyle(color: Colors.black),
                  ));
            }
          }))
        ],
      ),
      body: SfPdfViewer.network(
        url,
        enableDocumentLinkAnnotation: false,
        controller: controller,
        pageSpacing: 20,
        onDocumentLoadFailed: (PdfDocumentLoadFailedDetails details) {
          customSnackbar(context, details.error);
        },
      ),
    );
  }
}
