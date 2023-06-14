import 'package:flutter/material.dart';
import '../controller/exercises-controller.dart';
import '../model/Exercise.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  _CategoriesPageState createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  final ExercisesController _exerciseController = ExercisesController();
  List<String> _categories = [];
  String? _selectedCategory;
  Future<List<Exercise>>? _categoryExercises;

  @override
  void initState() {
    super.initState();
    _exerciseController.getAllExercises().then((exercises) {
      setState(() {
        _categories = exercises.map((e) => e.category).toSet().toList();
      });
    });
  }

  void _updateCategoryExercises(String category) {
    setState(() {
      _selectedCategory = category;
      _categoryExercises = _exerciseController.sameCategoryExercises(category);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Categories"),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _categories.length,
                itemBuilder: (context, index) {
                  String category = _categories[index];
                  return ListTile(
                    title: Text(category),
                    onTap: () => _updateCategoryExercises(category),
                  );
                },
              ),
            ),
            _selectedCategory != null
                ? Expanded(
              child: FutureBuilder<List<Exercise>>(
                future: _categoryExercises,
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
            )
                : Container(),
          ],
        ),
      ),
    );
  }
}

