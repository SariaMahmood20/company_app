class UserModel {
  UserModel({
    required this.employeeId,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.designation,
    required this.joinDate,
    required this.profilePictureUrl,
  });
  late final String employeeId;
  late final String firstName;
  late final String lastName;
  late final String email;
  late final String password;
  late final String designation;
  late final String joinDate;
  late final String profilePictureUrl;
  
  UserModel.fromJson(Map<String, dynamic> json){
    employeeId = json['employeeId'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    password = json['password'];
    designation = json['designation'];
    joinDate = json['joinDate'];
    profilePictureUrl = json['profilePictureUrl'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['employeeId'] = employeeId;
    _data['first_name'] = firstName;
    _data['last_name'] = lastName;
    _data['email'] = email;
    _data['password'] = password;
    _data['designation'] = designation;
    _data['joinDate'] = joinDate;
    _data['profilePictureUrl'] = profilePictureUrl;
    return _data;
  }
}