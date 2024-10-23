import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CheckinViewModel extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String employeeId; // Add employeeId to identify the user in Firestore

  bool _isCheckedCheckIn = false;
  bool _isCheckedCheckOut = false;
  String? _checkInTime;
  String? _checkOutTime;

  bool get isCheckedCheckIn => _isCheckedCheckIn;
  bool get isCheckedCheckOut => _isCheckedCheckOut;
  String? get checkInTime => _checkInTime;
  String? get checkOutTime => _checkOutTime;

  CheckinViewModel({required this.employeeId}) {
    _loadCheckInOutStatus(); // Load status from Firestore
  }

  // Load initial check-in/check-out data from Firestore
  Future<void> _loadCheckInOutStatus() async {
    try {
      final doc = await _firestore.collection('check_in').doc(employeeId).get();
      if (doc.exists) {
        final data = doc.data();
        if (data != null) {
          _isCheckedCheckIn = data['check_in'] != null;
          _checkInTime = data['check_in'];
          _isCheckedCheckOut = data['check_out'] != null;
          _checkOutTime = data['check_out'];
        }
      }
      notifyListeners();
    } catch (e) {
      print("Error loading check-in/out status: $e");
    }
  }

  // Toggle Check-In and update Firestore
  void toggleCheckIn() async {
    _isCheckedCheckIn = !_isCheckedCheckIn;

    if (_isCheckedCheckIn) {
      _checkInTime = DateFormat.jm().format(DateTime.now());
      // Save check-in time to Firestore
      await _firestore.collection('check_in').doc(employeeId).set({
        'check_in': _checkInTime,
      }, SetOptions(merge: true));
    } else {
      _checkInTime = null; // Reset check-in time
      // Remove check-in time from Firestore
      await _firestore.collection('check_in').doc(employeeId).update({
        'check_in': FieldValue.delete(),
      });
    }

    notifyListeners();
  }

  // Toggle Check-Out and update Firestore
  void toggleCheckOut() async {
    _isCheckedCheckOut = !_isCheckedCheckOut;

    if (_isCheckedCheckOut) {
      _checkOutTime = DateFormat.jm().format(DateTime.now());
      // Save check-out time to Firestore
      await _firestore.collection('check_in').doc(employeeId).set({
        'check_out': _checkOutTime,
      }, SetOptions(merge: true));
    } else {
      _checkOutTime = null; // Reset check-out time
      // Remove check-out time from Firestore
      await _firestore.collection('check_in').doc(employeeId).update({
        'check_out': FieldValue.delete(),
      });
    }

    notifyListeners();
  }
}
