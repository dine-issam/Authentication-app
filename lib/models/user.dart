import 'package:cloud_firestore/cloud_firestore.dart';

class UserProfile {
  final String uid;
  final String name;
  final String userName;
  final String email;
  final String phoneNumber;

  UserProfile(
      {required this.name,
      required this.uid,
      required this.userName,
      required this.email,
      required this.phoneNumber});

// FireBase ---> App
  factory UserProfile.fromDocument(DocumentSnapshot doc) {
    return UserProfile(
      name: doc['name'],
      uid: doc['uid'],
      userName: doc['userName'],
      email: doc['email'],
      phoneNumber: doc['phoneNumber'],
    );
  }

// App ---> FireBase

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'uid': uid,
      'userName': userName,
      'email': email,
      'phoneNumber': phoneNumber,
    };
  }
}
