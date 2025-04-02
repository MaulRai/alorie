import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  File? _image;

  final ImagePicker _picker = ImagePicker();

  // Pick an image from the gallery
  Future<void> _pickImage() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  // Take a picture using the camera
  Future<void> _takePicture() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image Picker App"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _image != null
                ? Image.file(
              _image!,
              height: 300,
              width: 300,
              fit: BoxFit.cover,
            )
                : Text('No image selected'),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: _pickImage,
                  child: Text('Select from Gallery'),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: _takePicture,
                  child: Text('Take a Picture'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}