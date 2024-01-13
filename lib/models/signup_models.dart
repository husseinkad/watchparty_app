class UserModel {
  final String displayName;
  final String email;

  UserModel({
    required this.displayName,
    required this.email,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      displayName: json['displayName'],
      email: json['email'],
    );
  }
}
