class UserModel {
  final String uid;
  final String imgUrl;
  final String name;
  final String email;
  late String designation;
  late String about;

  UserModel({
    required this.uid,
    required this.imgUrl,
    required this.name,
    required this.email,
    required this.designation,
    required this.about,
  });

  // Factory method to create a UserModel from a map
  factory UserModel.fromMap(Map<dynamic, dynamic> map) {
    return UserModel(
      uid: map['uid'] ?? '',
      imgUrl: map['imgUrl'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      designation: map['designation'] ?? '',
      about: map['about'] ?? '',
    );
  }
}