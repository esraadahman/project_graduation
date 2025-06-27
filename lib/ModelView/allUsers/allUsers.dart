class AllUsersModel {
  final bool status;
  final List<UserModel> users;

  AllUsersModel({required this.status, required this.users});

  factory AllUsersModel.fromJson(Map<String, dynamic> json) {
    return AllUsersModel(
      status: json['status'],
      users: (json['users'] as List<dynamic>)
          .map((e) => UserModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'users': users.map((x) => x.toJson()).toList(),
    };
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
