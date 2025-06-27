class UserDataModel {
  final Userdata user;
  final String message;

  UserDataModel({
    required this.user,
    required this.message,
  });

  factory UserDataModel.fromJson(Map<String, dynamic> json) {
    return UserDataModel(
      user: Userdata.fromJson(json['user']),
      message: json['message'],
    );
  }
}

class Userdata {
  final int id;
  final String? bio;
  final String name;
  final String email;
  final String? phone;
  final String? avatar;

  Userdata({
    required this.id,
    required this.name,
    required this.email,
    this.bio,
    this.phone,
    this.avatar,
  });

  factory Userdata.fromJson(Map<String, dynamic> json) {
    return Userdata(
      id: json['id'],
      name: json['name'],
      bio: json['bio'],
      email: json['email'],
      phone: json['phone'],
      avatar: json['avatar'],
    );
  }
}
