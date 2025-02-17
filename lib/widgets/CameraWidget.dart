import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CameraWidget extends StatefulWidget {
  const CameraWidget({super.key});

  @override
  _CameraWidgetState createState() => _CameraWidgetState();
}

class _CameraWidgetState extends State<CameraWidget> {
  File? _image;
  final ImagePicker _picker = ImagePicker();

  // Function to open camera and capture image
  Future<void> _openCamera() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.camera);
    
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _image == null
            ? Text("No Image Captured", style: TextStyle(fontSize: 18))
            : Image.file(_image!, width: 200, height: 200, fit: BoxFit.cover),
        
        SizedBox(height: 20),

        ElevatedButton.icon(
          onPressed: _openCamera,
          icon: Icon(Icons.camera_alt),
          label: Text("Open Camera"),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
          ),
        ),
      ],
    );
  }
}
