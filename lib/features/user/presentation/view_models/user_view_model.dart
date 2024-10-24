import 'package:flutter/material.dart';
import 'package:deutics_attendance_app/features/user/data/models/user_model.dart';
import 'package:deutics_attendance_app/features/user/data/services/user_services.dart';

class UserViewModel extends ChangeNotifier {
  final UserServices _userServices = UserServices();
  UserModel? _user; // Store the user data

  UserModel? get user => _user; // Expose user data to UI

  bool _isLoading = false; // Loading state
  bool get isLoading => _isLoading;

  // Method to fetch user data
  Future<void> fetchUserData() async {
    _isLoading = true;
    notifyListeners();
    
    try {
      _user = await _userServices.fetchData();
      if (_user == null) {
        print("No user data returned.");
      }
    } catch (e) {
      print("Error fetching user data: $e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Method to update password
  Future<void> updatePassword(String newPassword) async {
    if (_user != null) {
      await _userServices.updatePassword(newPassword);
      // Optionally update local model after updating Firestore
      _user = _user!.copyWith(password: newPassword);
      notifyListeners();
    } else {
      print("Cannot update password: user data is null.");
    }
  }

  // Method to update designation
  Future<void> updateDesignation(String newDesignation) async {
    if (_user != null) {
      await _userServices.updateDesignation(newDesignation);
      // Optionally update local model after updating Firestore
      _user = _user!.copyWith(designation: newDesignation);
      notifyListeners();
    } else {
      print("Cannot update designation: user data is null.");
    }
  }
}
