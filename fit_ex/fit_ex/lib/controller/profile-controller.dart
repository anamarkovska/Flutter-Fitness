import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_ex/model/User.dart';
import 'package:fit_ex/service/user-repository.dart';

class ProfileController {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final UserRepository _userRepo = UserRepository();

  User? get currentUser => _firebaseAuth.currentUser;

  getCurrentUser() async {
    final email = currentUser?.email;
    if (email != null)
      return _userRepo.currentUser(email);
  }

  Future<void> updateUserWeight(Users user, int newWeight) async {
    user.weight = newWeight;
    await _userRepo.updateUser(user);
  }

  Future<void> updateUserWeightGoal(Users user, int newWeightGoal) async {
    user.weightGoal = newWeightGoal;
    await _userRepo.updateUser(user);
  }
}