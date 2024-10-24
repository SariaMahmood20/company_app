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

  // Constructor to create the model from JSON
  CheckinModel.fromJson(Map<String, dynamic> json) {
    checkIn = json['check_in'] != null
        ? Timestamp.fromMillisecondsSinceEpoch(json['check_in'].millisecondsSinceEpoch)
        : Timestamp.now();
    checkOut = json['check_out'] != null
        ? Timestamp.fromMillisecondsSinceEpoch(json['check_out'].millisecondsSinceEpoch)
        : Timestamp.now();
    employeeId = json['employee_id'];
  }

  String? get id => null;

  // Instance method to convert the model to JSON
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['check_in'] = checkIn; // Firebase Timestamp can be directly used
    data['check_out'] = checkOut; // Firebase Timestamp can be directly used
    data['employee_id'] = employeeId;
    return data;
  }

  // Add copyWith method for immutability and updates
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
