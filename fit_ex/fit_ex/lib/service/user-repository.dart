import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_ex/model/User.dart';

class UserRepository {
  final _auth = FirebaseAuth.instance;
  final _db = FirebaseFirestore.instance;

  Future<void> signUpUser(String username, String password, int weight, int height, int weightGoal) async {
    try {
      final UserCredential = await _auth.createUserWithEmailAndPassword(
          email: username, password: password);
      await _db.collection('users').doc(UserCredential.user?.uid).set({
        'username': username,
        'weight': weight,
        'height': height,
        'weightGoal': weightGoal,
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> signInUser(String username, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: username, password: password);
    } catch (e) {
      print(e);
    }
  }

  createUser(Users user){
    _db.collection('users').add(user.toJson());
  }

  Future<Users> currentUser(String username) async {
    final snapshot = await _db.collection('users').where('username', isEqualTo: username).get();
    final userData = snapshot.docs.map((e) => Users.fromSnapshot(e)).first;
    return userData;
  }

  Future<void> updateUser(Users user) async {
    try {
      await _db.collection('users').doc(user.id).update(user.toJson());
    } catch (e) {
      print(e);
    }
  }
}