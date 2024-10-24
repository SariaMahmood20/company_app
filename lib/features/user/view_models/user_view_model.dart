import 'package:deutics_attendance_app/features/auth/data/services/session_manager.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import '../../../app/utils/utils.dart';
import '../models/user_model.dart';

class UserViewModel extends ChangeNotifier {
  UserModel? _user;

  UserModel? get user => _user;

  Future<void> fetchUser(BuildContext context) async {
    final databaseRef = FirebaseDatabase.instance.ref('Users/${SessionController().userId.toString()}'); // Reference to specific user node
    final snapshot = await databaseRef.get();
    if (snapshot.exists) {
      final userData = Map<dynamic, dynamic>.from(snapshot.value as dynamic);
      _user = UserModel.fromMap(userData);
      notifyListeners();
    } else {
      Utils.flushBarErrorMessages("Error: No data available", context);
    }
  }

  // // Method to update description
  // Future<void> updateDescription(BuildContext context, String newDescription) async {
  //   final databaseRef = FirebaseDatabase.instance.ref('Users/${SessionController().userId.toString()}');
  //   await databaseRef.update({'designation': newDescription}).then((_) {
  //     if (_user != null) {
  //       _user!.designation = newDescription;
  //       notifyListeners();
  //     }
  //   }).catchError((error) {
  //     Utils.flushBarErrorMessages("Error: Designation is not updated", context);
  //   });
  // }
  //
  // // Method to update about us
  // Future<void> updateAboutUs(BuildContext context, String newAbout) async {
  //   final databaseRef = FirebaseDatabase.instance.ref('Users/${SessionController().userId.toString()}');
  //   await databaseRef.update({'about': newAbout}).then((_) {
  //     if (_user != null) {
  //       _user!.about = newAbout;
  //       notifyListeners();
  //     }
  //   }).catchError((error) {
  //     Utils.flushBarErrorMessages("Error: About Us is not updated", context);
  //   });
  // }

}