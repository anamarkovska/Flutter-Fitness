// import 'package:fit_ex/model/User.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_ex/service/auth-service.dart';
import 'package:flutter/material.dart';

import '../service/user-repository.dart';

class UserController {
  final AuthService _authRepo = AuthService();

  final Email = TextEditingController();
  final Password = TextEditingController();
  final Weight = TextEditingController();
  final Height = TextEditingController();
  final WeightGoal = TextEditingController();

  Future signUpUser(String username, String password) async {
    await _authRepo.createUserWithEmailAndPassword(username, password);
  }

  Future<void> signInUser(String username, String password) async {
    _authRepo.signInWithEmailAndPassword(username, password);
  }


}