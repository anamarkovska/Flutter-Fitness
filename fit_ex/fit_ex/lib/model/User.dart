import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Users {
  final String? id;
  final String username;
  final String password;
  int weight;
  final int height;
  int weightGoal;

  Users({this.id,
    required this.username,
    required this.password,
    required this.weight,
    required this.height,
    required this.weightGoal,
  });

  toJson(){
    return {
      'username': username,
      'password': password,
      'weight': weight,
      'height': height,
      'weightGoal': weightGoal,
    };
  }

  factory Users.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document){
    final data = document.data()!;
    return Users(id: document.id, username: data['username'], password: data['password'], weight: data['weight'], height: data['height'], weightGoal: data['weightGoal']);
  }
}