import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deutics_attendance_app/features/user/data/models/user_model.dart';

const String REGISTER_USER_PREF = "user_model";

class RegisterUserService {
  final _firestore = FirebaseFirestore.instance;

  late final CollectionReference _registerUser;
  RegisterUserService() {
    _registerUser = _firestore
        .collection(REGISTER_USER_PREF)
        .withConverter<UserModel>(
            fromFirestore: (snapshots, _) =>
                UserModel.fromJson(snapshots.data()!),
            toFirestore: (snapshots, _) => snapshots.toJson());
  }

  Stream<QuerySnapshot> getUser(){
    return _registerUser.snapshots();
  }

  void addUser(UserModel user)async{
    _registerUser.add(user);
  }
}
