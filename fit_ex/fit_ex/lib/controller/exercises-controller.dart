import 'package:fit_ex/service/exercise-service.dart';
import '../model/Exercise.dart';

class ExercisesController {
  final ExerciseRepository _exerciseRepo = ExerciseRepository();

  Future<List<Exercise>> getAllExercises() async {
    return await _exerciseRepo.allExercises();
  }

  Future<List<Exercise>> sameCategoryExercises(String category) async {
    return await _exerciseRepo.exFromSameCategory(category);
  }

  exercisesFromLevelAndCategory(String level, String category) async {
    return await _exerciseRepo.exercisesFromLevelAndCategory(level, category);
  }

}