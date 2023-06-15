import 'dart:async';
import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import 'display-picture-screen.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';



class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    final camera = cameras.first;

    _controller = CameraController(
      camera,
      ResolutionPreset.medium,
    );

    _initializeControllerFuture = _controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    }).catchError((error) {
      print('Error: ${error.toString()}');
    });
  }


  void initCamera() {
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _takePicture() async {
    try {
      await _initializeControllerFuture;

      final Directory? extDir = await getExternalStorageDirectory();
      final String dirPath = '${extDir?.path}/Pictures/flutter_camera_app';
      await Directory(dirPath).create(recursive: true);
      final String fileName = '${DateTime.now()}.jpg';
      final String filePath = '$dirPath/$fileName';

      if (_controller.value.isTakingPicture) {
        // A capture is already pending, do nothing.
        return;
      }

      XFile pictureFile = await _controller.takePicture();
      final File savedFile = File(pictureFile.path);
      await savedFile.copy(filePath);

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DisplayPictureScreen(imagePath: filePath),
        ),
      );
    } catch (e) {
      print('Error: ${e.toString()}');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Camera App')),
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return CameraPreview(_controller);
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.camera),
        onPressed: _takePicture,
      ),
    );
  }
}
