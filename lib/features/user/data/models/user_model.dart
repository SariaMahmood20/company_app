class UserModel {
  UserModel({
    required this.employeeId,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.designation,
    required this.profilePictureUrl,
  });
  
  late final int employeeId;
  late final String firstName;
  late final String lastName;
  late final String email;
  late final String password;
  late final String designation;
  late final String profilePictureUrl;

  UserModel.fromJson(Map<String, dynamic> json) {
    employeeId = json['employeeId'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    password = json['password'];
    designation = json['designation'];
    profilePictureUrl = json['profile_picture_url'];
  }

  // Static toJson method
  static Map<String, dynamic> toJson(UserModel user) {
    final _data = <String, dynamic>{};
    _data['employeeId'] = user.employeeId;
    _data['first_name'] = user.firstName;
    _data['last_name'] = user.lastName;
    _data['email'] = user.email;
    _data['password'] = user.password;
    _data['designation'] = user.designation;
    _data['profile_picture_url'] = user.profilePictureUrl; // Keep the key consistent
    return _data;
  }

  // Add copyWith method
  UserModel copyWith({
    int? employeeId,
    String? firstName,
    String? lastName,
    String? email,
    String? password,
    String? designation,
    String? profilePictureUrl,
  }) {
    return UserModel(
      employeeId: employeeId ?? this.employeeId,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      password: password ?? this.password,
      designation: designation ?? this.designation,
      profilePictureUrl: profilePictureUrl ?? this.profilePictureUrl,
    );
  }
}
