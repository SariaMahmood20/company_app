import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deutics_attendance_app/features/leaves/data/models/application_model.dart';

const String USER_COLLECTION_REF = "user";

const String DOC_REF = "applications";

int collectionID = 1;

class FirebaseService {
  
  final _firestore = FirebaseFirestore.instance;

  late final CollectionReference _userRef;

  FirebaseService(){
    _userRef = _firestore.collection(USER_COLLECTION_REF).withConverter<ApplicationModel>(fromFirestore: (snapshots, _)=> ApplicationModel.fromJson(snapshots.data()!), toFirestore: (application, _)=>application.toJson());
  }

  Stream<List<ApplicationModel>> getAllApplications() {
    return _firestore
        .collection(USER_COLLECTION_REF).doc(DOC_REF).collection("2")
        .withConverter<ApplicationModel>(
          fromFirestore: (snapshot, _) => ApplicationModel.fromJson(snapshot.data()!),
          toFirestore: (application, _) => application.toJson(),
        )
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => doc.data()).toList()); 
  }

   Stream<List<ApplicationModel>> getApplicationsForUser(String userId) {
    return _firestore
        .collection(USER_COLLECTION_REF) 
        .doc(userId) 
        .collection(DOC_REF) 
        .withConverter<ApplicationModel>(
          fromFirestore: (snapshot, _) => ApplicationModel.fromJson(snapshot.data()!),
          toFirestore: (application, _) => application.toJson(),
        )
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => doc.data()).toList()); 
  }

  void addApplication(ApplicationModel application)async{
    await _firestore.collection(USER_COLLECTION_REF).doc(DOC_REF).collection("${collectionID+=1}").add(application.toJson());
  }
}
