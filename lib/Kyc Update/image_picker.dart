import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';

var imageValue;
XFile? image;

class ImagePickerScreen extends StatefulWidget {
  @override
  _ImagePickerScreenState createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {
  Future<void> getImageBytes(File file) async {
    var imageBytes = await file.readAsBytes();
    imageValue = imageBytes;
    print(imageValue);
  }

  String newImg = '';

  Future _getImageFromGallery() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        image = pickedFile;
        newImg = image!.path;
        Logger().d('newImg is $newImg');
      });
    }
    // getImageBytes(image);
  }

  Future _getImageFromCamera() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        image = pickedFile;
        newImg = image!.path;
        Logger().d(newImg);
      });
    }
    //  getImageBytes(image!);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                : AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Image.file(
                      File(image!.path),
                      fit: BoxFit.fill,
                    ),
                  ),
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
