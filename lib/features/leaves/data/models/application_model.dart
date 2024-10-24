

class ApplicationModel {
  ApplicationModel({
    required this.applicationId,
    required this.employeeId,
    required this.title,
    required this.description,
    required this.leaveDate,
    required this.reviewedAt,
    required this.submittedAt,
    required this.status,
  });

  late final String applicationId;
  late final String employeeId;
  late final String title;
  late final String description;
  late final String leaveDate;
  late final String reviewedAt;
  late final String submittedAt;
  late final String status;

  ApplicationModel.fromJson(Map<String, dynamic> json) {
    applicationId = json['applicationId'];
    employeeId = json['employeeId'];
    title = json['title'];
    description = json['description'];
    leaveDate = json['leave_date'];
    reviewedAt = json['reviewedAt'];
    submittedAt = json['submittedAt'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['applicationId'] = applicationId;
    _data['employeeId'] = employeeId;
    _data['title'] = title;
    _data['description'] = description;
    _data['leave_date'] = leaveDate;
    _data['reviewedAt'] = reviewedAt;
    _data['submittedAt'] = submittedAt;
    _data['status'] = status;
    return _data;
  }

  ApplicationModel copyWith({
    String? applicationId,
    String? employeeId,
    String? title,
    String? description,
    String? leaveDate,
    String? reviewedAt,
    String? submittedAt,
    String? status,
  }) {
    return ApplicationModel(
      applicationId: applicationId ?? this.applicationId,
      employeeId: employeeId ?? this.employeeId,
      title: title ?? this.title,
      description: description ?? this.description,
      leaveDate: leaveDate ?? this.leaveDate,
      reviewedAt: reviewedAt ?? this.reviewedAt,
      submittedAt: submittedAt ?? this.submittedAt,
      status: status ?? this.status,
    );
  }
}
