import 'package:auth_app/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DatabaseService {
  // Save User Profile Info
  final _db = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  Future<void> saveUserInfoInDatabase(
      String name, userName, email, phoneNumber) async {
    String uid = _auth.currentUser!.uid;

    UserProfile user = UserProfile(
        name: name,
        uid: uid,
        userName: userName,
        email: email,
        phoneNumber: phoneNumber);

    final userMap = user.toMap();

    await _db.collection('Users').doc(uid).set(userMap);
  }

  Future<UserProfile?> getUserInfoFromFirebase(String uid) async {
    try {
      // retrieve user doc from Firebase
      DocumentSnapshot userDoc = await _db.collection("Users").doc(uid).get();
      // convert doc to user profile
      return UserProfile.fromDocument(userDoc);
    } catch (e) {
      return null;
    }
  }
}
