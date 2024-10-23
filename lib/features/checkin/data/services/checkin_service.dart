import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deutics_attendance_app/features/checkin/data/models/checkin_model.dart';

const String CHECKIN_REF = "check_in";

class CheckinService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late final CollectionReference<CheckinModel> _checkinRef;

  CheckinService() {
    _checkinRef = _firestore.collection(CHECKIN_REF).withConverter<CheckinModel>(
      fromFirestore: (snapshots, _) => CheckinModel.fromJson(snapshots.data()!),
      toFirestore: (checkin, _) => checkin.toJsonInstance(),
    );
  }

  Future<void> checkIn(CheckinModel checkin, String employeeId) async {
    try {
      await _checkinRef.doc(employeeId).set(checkin.toJsonInstance() as CheckinModel, SetOptions(merge: true));
    } catch (e) {
      // Handle error, e.g., log the error or show a message
      print("Error checking in: $e");
    }
  }

  Future<void> checkOut(String employeeId, String checkOutTime) async {
    try {
      await _checkinRef.doc(employeeId).update({
        'check_out': checkOutTime,
      });
    } catch (e) {
      // Handle error, e.g., log the error or show a message
      print("Error checking out: $e");
    }
  }
}
