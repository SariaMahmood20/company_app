import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deutics_attendance_app/features/posts/data/services/post_services.dart';
import 'package:deutics_attendance_app/features/posts/data/models/post_model.dart';

class PostViewModel extends ChangeNotifier {
  final PostServices _firebaseService = PostServices();

  String? _errorMessage;
  String? get errorMessage => _errorMessage;
  List<PostModel> _posts = [];
  List<PostModel> get posts => _posts;

  Future<void> submitPost({
    required String content,
    required Timestamp time
  })async{
    try{
      final post = PostModel(
        content: content, 
        employeeId: "saria", 
        postdate: time.toString()
        );
        _firebaseService.addPost(post);
        notifyListeners();
    }catch(e){
      _errorMessage = "Error Submitting the post: $e";
      notifyListeners();
    }
  }

  Future<void> getPosts()async{
    try{
      _firebaseService.getAllPosts().listen((postList){
        _posts = postList;
        notifyListeners();
      });
    }catch (e){
      _errorMessage = "Error Submitting Post: $e";
      notifyListeners();
    }
  }
}
