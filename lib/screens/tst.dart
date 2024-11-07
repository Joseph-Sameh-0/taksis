import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ImageUploadTest extends StatefulWidget {
  @override
  _ImageUploadTestState createState() => _ImageUploadTestState();
}

class _ImageUploadTestState extends State<ImageUploadTest> {
  final ImagePicker _picker = ImagePicker();
  File? _imageFile;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  Future<void> _uploadImage() async {
    if (_imageFile != null) {
      final fileName = 'uploads/${DateTime.now().millisecondsSinceEpoch}.jpg';
      try {
        await _storage.ref(fileName).putFile(_imageFile!);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Image uploaded successfully!')),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Upload failed: $e')),
        );
        print(e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Test Image Upload")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _imageFile != null
                ? Image.file(_imageFile!, height: 200)
                : Text('No image selected'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _pickImage,
              child: Text('Pick Image'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _uploadImage,
              child: Text('Upload Image'),
            ),
          ],
        ),
      ),
    );
  }
}
