class Invitemodel {
  final bool status;
  final String message;
  final UserModel? user; // nullable, because sometimes it's missing

  Invitemodel({
    required this.status,
    required this.message,
    this.user,
  });

  factory Invitemodel.fromJson(Map<String, dynamic> json) {
    return Invitemodel(
      status: json['status'] as bool,
      message: json['message'] ?? '',
      user: json['user'] != null
          ? UserModel.fromJson(json['user'] as Map<String, dynamic>)
          : null,
    );
  }
}

class UserModel {
  final int id;
  final String name;
  final String? avatar;

  UserModel({required this.id, required this.name, this.avatar});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      avatar: json['avatar'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'avatar': avatar,
    };
  }
}
