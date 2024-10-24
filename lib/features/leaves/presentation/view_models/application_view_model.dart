import 'package:flutter/material.dart';
import 'package:deutics_attendance_app/features/leaves/data/models/application_model.dart';
import 'package:deutics_attendance_app/features/leaves/data/services/application_services.dart';

class ApplicationViewModel extends ChangeNotifier {
  final FirebaseService _firebaseService = FirebaseService();
  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  List<ApplicationModel> _applications = [];

  List<ApplicationModel> get applications => _applications;

  Future<void> submitApplication({
    required String applicationId,
    required String employeeId,
    required String title,
    required String description,
    required String leaveDate,
    required String reviewedAt,
    required String submittedAt,
    required String status,
  }) async {
    try {
      final application = ApplicationModel(
        applicationId: applicationId,
        employeeId: employeeId,
        title: title,
        description: description,
        leaveDate: leaveDate,
        reviewedAt: reviewedAt,
        submittedAt: submittedAt,
        status: status,
      );

      _firebaseService.addApplication(application); // Assuming createPost is adapted to accept ApplicationModel
      notifyListeners(); // Notify listeners about the change
    } catch (e) {
      _errorMessage = "Error submitting application: $e";
      notifyListeners();
    }
  }
  
  Future<void> getApplication() async {
    try {
      _firebaseService.getAllApplications().listen((applicationList){
        _applications = applicationList;
        notifyListeners(); 
      }); // Assuming createPost is adapted to accept ApplicationModel
      // Notify listeners about the change
    } catch (e) {
      _errorMessage = "Error submitting application: $e";
      notifyListeners();
    }
  }
}
