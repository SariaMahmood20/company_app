// ignore_for_file: depend_on_referenced_packages

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deutics_attendance_app/features/checkin/data/models/checkin_model.dart';


const  String USER_COLLECTION_REF = "user";

const String DOC_REF = "check_in";

const String records = "Records";

class CheckinService {
  final _firestore = FirebaseFirestore.instance;

  late final CollectionReference _userRef;

  CheckinService() {
    _userRef = _firestore.collection(USER_COLLECTION_REF).withConverter<CheckinModel>(
      fromFirestore: (snapshots, _) => CheckinModel.fromJson(snapshots.data()!),
      toFirestore: (checkin, _) => checkin.toJson(),
    );
  }

  Stream<List<CheckinModel>> getAllCheckins() {
    return _firestore
        .collection(USER_COLLECTION_REF)
        .doc(DOC_REF)
        .collection(records)
        .withConverter(
          fromFirestore: (snapshots, _) => CheckinModel.fromJson(snapshots.data()!),
          toFirestore: (checkins, _) => checkins.toJson(),
        )
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => doc.data()).toList());
  }

  Stream<List<CheckinModel>> getCheckinForUser(String userId) {
    return _firestore
        .collection(USER_COLLECTION_REF)
        .doc(DOC_REF)
        .collection(records)
        .withConverter(
          fromFirestore: (snapshots, _) => CheckinModel.fromJson(snapshots.data()!),
          toFirestore: (checkins, _) => checkins.toJson(),
        )
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => doc.data()).toList());
  }

  void addCheckin(CheckinModel checkin) async {
    await _firestore
        .collection(USER_COLLECTION_REF)
        .doc(DOC_REF)
        .collection(records)
        .add(checkin.toJson());
  }

  // New update method to change only the checkout time
  void updateCheckin(String documentId, Timestamp checkOut) async {
    await _firestore
        .collection(USER_COLLECTION_REF)
        .doc(DOC_REF)
        .collection(records)
        .doc(documentId)
        .update({'checkOut': checkOut}); // Update only the checkOut field
  }
}
