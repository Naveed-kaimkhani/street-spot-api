class UserModel {
  final int? id;
  final String name;

  final String email;

  final String? profilePicture;
  final String? password;

  final String? otp;
  final String role;

  UserModel({
    this.id,
    required this.name,
    required this.email,
    this.password,

    this.otp,
    required this.role,
    this.profilePicture,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? 0,
      name: json['username'] ?? '',
      email: json['email'] ?? '',
      profilePicture: json['profile_picture'] ?? "",
      role: json['role'] ?? '',

      // otp: json['otp'] ?? '',
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "username": name,
      "email": email,
      "password": password,
      "profile_picture": "",
      "role": role,
    };
  }
}
