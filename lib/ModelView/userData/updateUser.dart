class UpdateUserModel {
  final UserUpdate user;
  final String message;

  UpdateUserModel({
    required this.user,
    required this.message,
  });

  factory UpdateUserModel.fromJson(Map<String, dynamic> json) {
    return UpdateUserModel(
      user: UserUpdate.fromJson(json['user']),
      message: json['message'],
    );
  }
}

class UserUpdate {
  final int id;
  final String name;
  final String email;
  final String? emailVerifiedAt;
  final String? createdAt;
  final String? updatedAt;
  final String type;
  final String? phone;
  final int? userId;
  final String? avatar;
  final String? bio;

  UserUpdate({
    required this.id,
    required this.name,
    required this.email,
    this.emailVerifiedAt,
    this.createdAt,
    this.updatedAt,
    required this.type,
    this.phone,
    this.userId,
    this.avatar,
    this.bio,
  });

  factory UserUpdate.fromJson(Map<String, dynamic> json) {
    return UserUpdate(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      emailVerifiedAt: json['email_verified_at'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      type: json['type'],
      phone: json['phone'],
      userId: json['user_id'],
      avatar: json['avatar'],
      bio: json['bio'],
    );
  }
}
