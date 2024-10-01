import 'package:auth_app/models/user.dart';
import 'package:auth_app/services/database/database_service.dart';
import 'package:flutter/material.dart';

class DatabaseProvider extends ChangeNotifier {
  // get db service

  final _db = DatabaseService();

  // get user profile for a given uid
  Future<UserProfile?> userProfile(String uid) =>
      _db.getUserInfoFromFirebase(uid);
}
