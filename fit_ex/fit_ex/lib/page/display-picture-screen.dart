import 'dart:io';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;

  const DisplayPictureScreen({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final formattedDate = DateFormat('dd.MM.yyyy HH:mm').format(now);

    return Scaffold(
      appBar: AppBar(title: Text('Display Picture')),
      body: Center(
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 80),
          Image.file(
            File(imagePath),
            fit: BoxFit.fill,
          ),
          SizedBox(height: 16),
          Text(
            'Date Taken: $formattedDate',
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
      )
    );
  }
}