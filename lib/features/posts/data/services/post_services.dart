import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deutics_attendance_app/features/posts/data/models/post_model.dart';


const String USER_COLLECTION_REF = 'user';
const String DOC_REF = 'posts';
const String posts = "posts";

class PostServices{
  final _firestore = FirebaseFirestore.instance;

  late final CollectionReference _userRef;

  FirebaseService(){
    _userRef = _firestore.collection(USER_COLLECTION_REF).withConverter<PostModel>(fromFirestore: (snapshots, _)=> PostModel.fromJson(snapshots.data()!), toFirestore: (application, _)=>application.toJson());
  }

  Stream<List<PostModel>> getAllPosts(){
    return _firestore.collection(USER_COLLECTION_REF).doc(DOC_REF).collection(posts).withConverter<PostModel>(fromFirestore: (snapshots, _)=>PostModel.fromJson(snapshots.data()!), toFirestore: (post, _)=>post.toJson()).snapshots().map((snapshot)=>snapshot.docs.map((doc)=>doc.data()).toList());
  }

  Stream<List<PostModel>> getPostsForUser(String employeeId){
    return _firestore.collection(USER_COLLECTION_REF).doc(employeeId).collection(posts).withConverter<PostModel>(fromFirestore: (snapshots, _)=>PostModel.fromJson(snapshots.data()!), toFirestore: (posts, _)=>posts.toJson()).snapshots().map((snapshot)=>snapshot.docs.map((doc)=>doc.data()).toList());
  }
  void addPost(PostModel post)async{
    await _firestore.collection(USER_COLLECTION_REF).doc(DOC_REF).collection(posts).add(post.toJson());
  }
}