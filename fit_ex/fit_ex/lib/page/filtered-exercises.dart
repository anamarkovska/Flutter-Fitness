import 'package:flutter/material.dart';
import 'package:fit_ex/page/exercise-details.dart';
import 'package:fit_ex/controller/exercises-controller.dart';
import 'package:fit_ex/model/Exercise.dart';

class ExercisesByCategoryScreen extends StatefulWidget {
  final String level;
  final String category;
  final Color backgroundColor;

  ExercisesByCategoryScreen(
      this.level,
      this.category, {
        this.backgroundColor = const Color.fromRGBO(95, 95, 95, 1),
      });

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
    _exerciseList = await _exercisesController.exercisesFromLevelAndCategory(
      widget.level,
      widget.category,
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.category} Exercises'),
      ),
      body: Container(
        color: widget.backgroundColor ?? Color.fromRGBO(95, 95, 95, 1),
        padding: EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: _exerciseList.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 2.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    _exerciseList[index].image,
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text(
                  _exerciseList[index].name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ExerciseDetailsScreen(
                        _exerciseList[index],
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
