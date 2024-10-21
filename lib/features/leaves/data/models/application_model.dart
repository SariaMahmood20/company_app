class ApplicationModel {
  ApplicationModel({
    required this.applicationId,
    required this.employeeId,
    required this.status,
    required this.submittedAt,
    required this.reviewedAt,
    required this.title,
    required this.description,
  });
  late final String applicationId;
  late final String employeeId;
  late final String status;
  late final String submittedAt;
  late final String reviewedAt;
  late final String title;
  late final String description;
  
  ApplicationModel.fromJson(Map<String, dynamic> json){
    applicationId = json['applicationId'];
    employeeId = json['employeeId'];
    status = json['status'];
    submittedAt = json['submittedAt'];
    reviewedAt = json['reviewedAt'];
    title = json['title'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['applicationId'] = applicationId;
    _data['employeeId'] = employeeId;
    _data['status'] = status;
    _data['submittedAt'] = submittedAt;
    _data['reviewedAt'] = reviewedAt;
    _data['title'] = title;
    _data['description'] = description;
    return _data;
  }
}