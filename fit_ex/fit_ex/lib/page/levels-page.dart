import 'package:flutter/material.dart';
import '../controller/exercises-controller.dart';
import '../model/Exercise.dart';
import 'filtered-exercises.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  final ExercisesController _exerciseController = ExercisesController();
  Map<String, List<String>> _categoriesByLevel = {};
  late Future<List<Exercise>> _exercises;

  @override
  void initState() {
    super.initState();
    _exercises = _exerciseController.getAllExercises();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Categories"),
      ),
      body: Container(
        child: FutureBuilder<List<Exercise>>(
          future: _exercises,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Exercise>? exercises = snapshot.data;
              exercises?.forEach((exercise) {
                String level = exercise.level;
                if (!_categoriesByLevel.containsKey(level)) {
                  _categoriesByLevel[level] = [];
                }
                _categoriesByLevel[level]?.add(exercise.category);
              });
              return ListView.builder(
                itemCount: _categoriesByLevel.keys.length,
                itemBuilder: (context, index) {
                  String level = _categoriesByLevel.keys.elementAt(index);
                  List<String>? categories = _categoriesByLevel[level]?.toSet().toList();
                  return ExpansionTile(
                    title: Text(level),
                    children: categories!.map((category) {
                      return ListTile(
                        title: Text(category),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ExercisesByCategoryScreen(level, category),
                            ),
                          );
                        },
                      );
                    }).toList(),
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
