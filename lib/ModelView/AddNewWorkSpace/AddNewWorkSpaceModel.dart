
class GroupResponse {
  final bool status;
  final Group group;
  final List<User> users;

  GroupResponse({
    required this.status,
    required this.group,
    required this.users,
  });

  factory GroupResponse.fromJson(Map<String, dynamic> json) {
    return GroupResponse(
      status: json['status'],
      group: Group.fromJson(json['group']),
      users: List<User>.from(json['users'].map((user) => User.fromJson(user))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'group': group.toJson(),
      'users': users.map((user) => user.toJson()).toList(),
    };
  }
}

class Group {
  final String title;
  final int? docId;
  final String? image;
  final String description;
  final String stage;
  final DateTime deadline;
  final DateTime updatedAt;
  final DateTime createdAt;
  final int id;
  final List<User> users;

  Group({
    required this.title,
    this.docId,
    this.image,
    required this.description,
    required this.stage,
    required this.deadline,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
    required this.users,
  });

  factory Group.fromJson(Map<String, dynamic> json) {
    return Group(
      title: json['title'],
      docId: json['doc_id'],
      image: json['image'],
      description: json['description'],
      stage: json['stage'],
      deadline: DateTime.parse(json['deadline']),
      updatedAt: DateTime.parse(json['updated_at']),
      createdAt: DateTime.parse(json['created_at']),
      id: json['id'],
      users: List<User>.from(json['users'].map((user) => User.fromJson(user))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'doc_id': docId,
      'image': image,
      'description': description,
      'stage': stage,
      'deadline': deadline.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'created_at': createdAt.toIso8601String(),
      'id': id,
      'users': users.map((user) => user.toJson()).toList(),
    };
  }
}

class User {
  final int id;
  final String name;
  final String email;
  final DateTime? emailVerifiedAt;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String type;
  final String? phone;
  final int? userId;
  final String? avatar;
  final UserPivot pivot;

  User({
    required this.id,
    required this.name,
    required this.email,
    this.emailVerifiedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.type,
    this.phone,
    this.userId,
    this.avatar,
    required this.pivot,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      emailVerifiedAt: json['email_verified_at'] != null
          ? DateTime.parse(json['email_verified_at'])
          : null,
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      type: json['type'],
      phone: json['phone'],
      userId: json['user_id'],
      avatar: json['avatar'],
      pivot: UserPivot.fromJson(json['pivot']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'email_verified_at': emailVerifiedAt?.toIso8601String(),
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'type': type,
      'phone': phone,
      'user_id': userId,
      'avatar': avatar,
      'pivot': pivot.toJson(),
    };
  }
}

class UserPivot {
  final int groupId;
  final int userId;
  final String position;

  UserPivot({
    required this.groupId,
    required this.userId,
    required this.position,
  });

  factory UserPivot.fromJson(Map<String, dynamic> json) {
    return UserPivot(
      groupId: json['group_id'],
      userId: json['user_id'],
      position: json['position'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'group_id': groupId,
      'user_id': userId,
      'position': position,
    };
  }
}
