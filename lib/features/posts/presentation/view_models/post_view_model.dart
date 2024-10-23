import 'package:flutter/material.dart';
import 'package:deutics_attendance_app/features/posts/data/services/post_services.dart';

class PostViewModel extends ChangeNotifier {
  final FirebaseService _firebaseService = FirebaseService();

  Future<void> createPost(String content, String employeeId) async {
    try {
      await _firebaseService.createPost(content, employeeId);
      notifyListeners();
    } catch (e) {
      print("Error creating post: $e");
    }
  }
}
