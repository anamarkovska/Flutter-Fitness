import 'package:flutter/material.dart';
import '../BottomNavBar.dart';
import '../controller/exercises-controller.dart';
import '../model/Exercise.dart';
import 'filtered-exercises.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

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
        title: const Text("Categories"),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder<List<Exercise>>(
          future: _exercises,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final List<Exercise>? exercises = snapshot.data;
              exercises?.forEach((exercise) {
                final String level = exercise.level;
                if (!_categoriesByLevel.containsKey(level)) {
                  _categoriesByLevel[level] = [];
                }
                _categoriesByLevel[level]?.add(exercise.category);
              });
              return ListView.builder(
                itemCount: _categoriesByLevel.keys.length,
                itemBuilder: (context, index) {
                  final String level = _categoriesByLevel.keys.elementAt(index);
                  final List<String>? categories = _categoriesByLevel[level]?.toSet().toList();
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: ExpansionTile(
                      title: Text(
                        level,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      children: categories!.map((category) {
                        return ListTile(
                          title: Text(
                            category,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ExercisesByCategoryScreen(level, category),
                              ),
                            );
                          },
                        );
                      }).toList(),
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
