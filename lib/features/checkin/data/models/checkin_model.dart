import 'package:cloud_firestore/cloud_firestore.dart'; // Import the Firestore package

class CheckinModel {
  CheckinModel({
    required this.checkIn,
    required this.checkOut,
    required this.employeeId,
  });

  late final Timestamp checkIn; // Change data type to Timestamp
  late final Timestamp checkOut; // Change data type to Timestamp
  late final String employeeId;

  CheckinModel.fromJson(Map<String, dynamic> json) {
    checkIn = json['check_in'] != null ? Timestamp.fromMillisecondsSinceEpoch(json['check_in'].millisecondsSinceEpoch) : Timestamp.now();
    checkOut = json['check_out'] != null ? Timestamp.fromMillisecondsSinceEpoch(json['check_out'].millisecondsSinceEpoch) : Timestamp.now();
    employeeId = json['employee_id'];
  }

  // Convert instance to JSON using a static method
  static Map<String, dynamic> toJson(CheckinModel instance) {
    final _data = <String, dynamic>{};
    _data['check_in'] = instance.checkIn; // Firebase Timestamp can be directly used
    _data['check_out'] = instance.checkOut; // Firebase Timestamp can be directly used
    _data['employee_id'] = instance.employeeId;
    return _data;
  }

  // Method to convert instance to JSON (instance method)
  Map<String, dynamic> toJsonInstance() {
    return {
      'check_in': checkIn,
      'check_out': checkOut,
      'employee_id': employeeId,
    };
  }

  // Add copyWith method
  CheckinModel copyWith({
    Timestamp? checkIn,
    Timestamp? checkOut,
    String? employeeId,
  }) {
    return CheckinModel(
      checkIn: checkIn ?? this.checkIn,
      checkOut: checkOut ?? this.checkOut,
      employeeId: employeeId ?? this.employeeId,
    );
  }
}
