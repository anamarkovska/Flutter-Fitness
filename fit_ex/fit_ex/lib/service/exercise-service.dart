import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/Exercise.dart';

class ExerciseRepository {

  final _db = FirebaseFirestore.instance;

  Future<List<Exercise>> allExercises() async {
    final snapshot = await _db.collection('excercise').get();
    final exerciseData = snapshot.docs.map((e) => Exercise.fromSnapshot(e)).toList();
    return exerciseData;
  }

  Future<List<Exercise>> exFromSameCategory(String category) async {
    final snapshot = await _db.collection('excercise').where('category', isEqualTo: category).get();
    final exerciseData = snapshot.docs.map((e) => Exercise.fromSnapshot(e)).toList();
    return exerciseData;
  }

  Future<List<Exercise>> exercisesFromLevelAndCategory(String level, String category) async {
    final snapshot = await _db.collection('excercise').where('level', isEqualTo: level)
        .where('category', isEqualTo: category).get();
    final exerciseData = snapshot.docs.map((e) => Exercise.fromSnapshot(e)).toList();
    return exerciseData;
  }
}