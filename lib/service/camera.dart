import 'dart:io';
import 'package:flutter/material.dart';
import 'package:camera_app/service/image_picker_helper.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({Key? key}) : super(key: key);

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  String file = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tugas 3"),
      ),
      body: Container(
        child: Column(
          children: [
            _imageSection(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buttonGallery(),
                _buttonCamera(),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _imageSection() {
    if (file.isEmpty) {
      return Image.network(
        "https://images.unsplash.com/photo-1504253163759-c23fccaebb55?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8MXx8fGVufDB8fHx8&w=1000&q=80.jpg",
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.width * 0.5,
      );
    } else {
      return Image.file(
        File(file),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.width * 0.5,
      );
    }
  }

  void _processImage(String? filePath) {
    if (filePath != null) {
      setState(() {
        file = filePath;
      });
    }
    ;
  }

  Widget _buttonGallery() {
    return ElevatedButton(
      onPressed: () {
        ImagePickerHelper().imagePickerFromGallery((filePath) {
          _processImage(filePath);
        });
      },
      child: Text("From Gallery"),
    );
  }

  Widget _buttonCamera() {
    return ElevatedButton(
      onPressed: () {
        ImagePickerHelper()
            .imagePickerFromCamera((filePath) => _processImage(filePath));
      },
      child: Text("From Camera"),
    );
  }
}