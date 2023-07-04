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
      appBar: AppBar(
        title: Text('Display Picture'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 6.0,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.file(
                  File(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(height: 16.0),
          Text(
            'Date Taken: $formattedDate',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16.0),
        ],
      ),
    );
  }
}
