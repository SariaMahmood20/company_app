import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:deutics_attendance_app/features/checkin/data/models/checkin_model.dart';
import 'package:deutics_attendance_app/features/checkin/data/services/checkin_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CheckinViewModel extends ChangeNotifier {
  final CheckinService _checkinService = CheckinService();
  String employeeId = "check_in"; // Can be updated dynamically in actual app

  bool _isCheckedCheckIn = false;
  bool _isCheckedCheckOut = false;
  Timestamp? _checkInTime;
  Timestamp? _checkOutTime;

  List<CheckinModel> _checkinRecords = []; // List to hold check-in/check-out records

  bool get isCheckedCheckIn => _isCheckedCheckIn;
  bool get isCheckedCheckOut => _isCheckedCheckOut && _isCheckedCheckIn;

  // Format the check-in time as 9:30 AM/PM
  String? get checkInTime => _checkInTime != null ? DateFormat('h:mm a').format(_checkInTime!.toDate()) : null;

  // Format the check-out time as 9:30 AM/PM
  String? get checkOutTime => _checkOutTime != null ? DateFormat('h:mm a').format(_checkOutTime!.toDate()) : null;

  List<CheckinModel> get checkinRecords => _checkinRecords; // Expose the list of records

  CheckinViewModel() {
    _loadCheckInOutStatus(); // Load check-in/out status on initialization
  }

  // Load the current user's check-in and check-out status
  Future<void> _loadCheckInOutStatus() async {
    try {
      final checkins = await _checkinService.getCheckinForUser(employeeId).first; // Get the first data from the stream
      if (checkins.isNotEmpty) {
        _checkinRecords = checkins; // Store all check-in/check-out records
        CheckinModel lastCheckin = checkins.last; // Get the latest check-in/check-out record
        _isCheckedCheckIn = lastCheckin.checkIn != null;
        _checkInTime = lastCheckin.checkIn;
        _isCheckedCheckOut = lastCheckin.checkOut != null;
        _checkOutTime = lastCheckin.checkOut;
      }
      notifyListeners();
    } catch (e) {
      print("Error loading check-in/out status: $e");
    }
  }

  // Get all check-in records for the user
  Future<void> getCheckinRecords() async {
    try {
      final checkins = await _checkinService.getAllCheckins().first; // Get all records from the stream
      _checkinRecords = checkins; // Store the records in the list
      notifyListeners();
    } catch (e) {
      print("Error fetching check-in records: $e");
    }
  }

  // Toggle check-in status
  Future<void> toggleCheckIn() async {
    if (_isCheckedCheckIn) {
      return; // Don't allow toggling if already checked-in
    }

    _isCheckedCheckIn = true;
    Timestamp checkInTimestamp = Timestamp.fromDate(DateTime.now());
    _checkInTime = checkInTimestamp;

    // Create a new CheckinModel and save it using the service
    final checkin = CheckinModel(
      checkIn: checkInTimestamp,
      checkOut: _checkOutTime ?? Timestamp.now(),
      employeeId: employeeId,
    );
    
    // Add to the list of records
    _checkinRecords.add(checkin);
    
    _checkinService.addCheckin(checkin); // Save to the database

    // Reset the toggle after successful check-in
    _isCheckedCheckIn = false; // Reset to allow for another check-in
    notifyListeners();
  }

  // Toggle check-out status, but only if check-in has been done
  Future<void> toggleCheckOut() async {
    if (!_isCheckedCheckIn || _isCheckedCheckOut) {
      return; // Do not allow check-out if check-in is not done or check-out is already done
    }

    _isCheckedCheckOut = true;
    Timestamp checkOutTimestamp = Timestamp.now();
    _checkOutTime = checkOutTimestamp;

    // Update the check-out time for the current check-in using CheckinModel
    final checkin = CheckinModel(
      checkIn: _checkInTime!, // Check-in must be done before check-out
      checkOut: checkOutTimestamp,
      employeeId: employeeId,
    );

    // Update the latest record in the list
    if (_checkinRecords.isNotEmpty) {
      _checkinRecords[_checkinRecords.length - 1] = checkin; // Update the last record with new check-out time
    }

    _checkinService.addCheckin(checkin); // Add or update check-out

    // Reset the toggles after successful check-out
    _isCheckedCheckOut = false;
    _isCheckedCheckIn = false; // Optionally reset check-in if needed
    notifyListeners();
  }
}
