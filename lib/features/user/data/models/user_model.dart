class UserModel {
  UserModel({
    required this.designation,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.password,
  });
  
  late final String designation;
  late final String email;
  late final String firstName;
  late final String lastName;
  late final String password;
  
  // Named constructor to create UserModel from JSON data
  UserModel.fromJson(Map<String, dynamic> json) {
    designation = json['designation'];
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    password = json['password'];
  }

  // Method to convert UserModel to JSON
  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['designation'] = designation;
    _data['email'] = email;
    _data['first_name'] = firstName;
    _data['last_name'] = lastName;
    _data['password'] = password;
    return _data;
  }

  // CopyWith method to return a modified copy of the UserModel
  UserModel copyWith({
    String? designation,
    String? email,
    String? firstName,
    String? lastName,
    String? password,
  }) {
    return UserModel(
      designation: designation ?? this.designation,
      email: email ?? this.email,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      password: password ?? this.password,
    );
  }
}
