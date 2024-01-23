import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';

var imageValue;

class ImagePickerScreen extends StatefulWidget {
  @override
  _ImagePickerScreenState createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {
  static File? image;
  Future<void> getImageBytes(File file) async {
    var imageBytes = await file.readAsBytes();
    imageValue = imageBytes;
    print(imageValue);
  }

  Future _getImageFromGallery() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        image = File(pickedFile.path);
      });
    }
    getImageBytes(image!);
  }

  Future _getImageFromCamera() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        image = File(pickedFile.path);
      });
    }
    getImageBytes(image!);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      height: MediaQuery.of(context).size.height * 0.4,
      width: double.infinity,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            image == null
                ? const Column(
                    children: [
                      Center(child: Text('Please Select your Image.')),
                    ],
                  )
                : Image.file(image!,
                    height: MediaQuery.of(context).size.height * 0.30,
                    width: MediaQuery.of(context).size.width * 1,
                    fit: BoxFit.cover),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _getImageFromGallery,
                  child: const Text('Pick from Gallery'),
                ),
                ElevatedButton(
                  onPressed: _getImageFromCamera,
                  child: const Text('Take a Picture'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
