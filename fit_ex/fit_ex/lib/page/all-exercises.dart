import 'package:flutter/material.dart';
import '../controller/exercises-controller.dart';
import '../model/Exercise.dart';

class AllExercisesScreen extends StatefulWidget {
  const AllExercisesScreen({super.key});

  @override
  _AllExercisesScreenState createState() => _AllExercisesScreenState();
}

class _AllExercisesScreenState extends State<AllExercisesScreen> {
  final ExercisesController _exerciseController = ExercisesController();
  late Future<List<Exercise>> _allExercises;

  @override
  void initState() {
    super.initState();
    _allExercises = _exerciseController.getAllExercises();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Exercises"),
      ),
      body: Container(
        child: FutureBuilder<List<Exercise>>(
          future: _allExercises,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Exercise>? exercises = snapshot.data;
              return ListView.builder(
                itemCount: exercises?.length,
                itemBuilder: (context, index) {
                  Exercise exercise = exercises![index];
                  return ListTile(
                    title: Text(exercise.name),
                    subtitle: Text(exercise.category),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
