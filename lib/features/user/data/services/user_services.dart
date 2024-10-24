import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deutics_attendance_app/features/user/data/models/user_model.dart';

const String USER_COLLECTION_REF = "user";
const String DOC_REF = 'user_info';

class UserServices {
  final _firestore = FirebaseFirestore.instance;

  late final CollectionReference _userRef;

  UserServices() {
    _userRef = _firestore.collection(USER_COLLECTION_REF).withConverter<UserModel>(
      fromFirestore: (snapshots, _)=> UserModel.fromJson(snapshots.data()!),
      toFirestore: (user, _) => user.toJson(),
    );
  }

  // Method to update the password
  Future<void> updatePassword(String password) async {
    await _firestore.collection(USER_COLLECTION_REF).doc(DOC_REF).update({"password": password});
  }

  // Method to update the designation
  Future<void> updateDesignation(String designation) async {
    await _firestore.collection(USER_COLLECTION_REF).doc(DOC_REF).update({"designation": designation});
  }

  // Fetch user data from Firestore
  Future<UserModel?> fetchData() async {
    final UserModel user;
    final snapshot = await _firestore.collection(USER_COLLECTION_REF).doc(DOC_REF).get();
    if (snapshot.exists) {
      print(snapshot.toString()+"1234567890");
      user = UserModel.fromJson(snapshot.data()!);
      print(user.email);
      return user;

    } else {
      throw Exception("User not found");
    }
  }
}
