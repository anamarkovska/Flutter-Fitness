import 'package:fit_ex/page/exercise-details.dart';
import 'package:flutter/material.dart';
import '../controller/exercises-controller.dart';
import '../model/Exercise.dart';


class ExercisesByCategoryScreen extends StatefulWidget {
  final String level;
  final String category;

  ExercisesByCategoryScreen(this.level, this.category);

  @override
  _ExercisesByCategoryScreenState createState() =>
      _ExercisesByCategoryScreenState();
}

class _ExercisesByCategoryScreenState extends State<ExercisesByCategoryScreen> {
  final ExercisesController _exercisesController = ExercisesController();
  List<Exercise> _exerciseList = [];

  @override
  void initState() {
    super.initState();
    _loadExercises();
  }

  void _loadExercises() async {
    _exerciseList =
    await _exercisesController.exercisesFromLevelAndCategory(widget.level, widget.category);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category + ' Exercises'),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: _exerciseList.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Image.asset(_exerciseList[index].image,
                  width: 150, fit: BoxFit.fitWidth),
              title: Text(_exerciseList[index].name),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ExerciseDetailsScreen(_exerciseList[index]),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}