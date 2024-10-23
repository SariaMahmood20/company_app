import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deutics_attendance_app/features/posts/models/post_model.dart';

class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> createPost(String content, String employeeId) async {
    if (content.isEmpty) {
      throw Exception("Post content cannot be empty");
    }

    // Create a PostModel instance
    final post = PostModel(
      content: content,
      employeeId: employeeId,
      postdate: Timestamp.now().toDate().toString(),
    );

    try {
      await _firestore.collection('posts').add(post.toJson());
    } catch (e) {
      throw Exception("Error creating post: $e");
    }
  }
}