import 'package:cloud_firestore/cloud_firestore.dart';

class Exercise{

  int? id;
  String name;
  String category;
  String level;
  String description;
  String image;

  Exercise({this.id, required this.name, required this.category, required this.level, required this.description, required this.image});

  factory Exercise.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document){
    final data = document.data()!;
    return Exercise(name: data['name'], category: data['category'], level: data['level'], description: data['description'], image: data['image']);
  }
}