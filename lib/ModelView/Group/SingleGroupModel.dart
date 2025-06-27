import 'package:gradution_project/Core/Imports/common_imports.dart';

class SingleGroupModel {
  final bool status;
  final Group group;

  SingleGroupModel({required this.status, required this.group});

  factory SingleGroupModel.fromJson(Map<String, dynamic> json) {
    return SingleGroupModel(
      status: json['status'],
      group: Group.fromJson(json['group']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'group': group.toJson(),
    };
  }
}

class Group {
  final int id;
  final String title;
  final String? image; // Nullable
  final String stage;
  final String? docId; // Nullable
  final String createdAt;
  final String updatedAt;
  final String? categoryId; // Nullable
  final String? description; // Nullable
  final String? deadline; // Nullable
  final List<User> users;

  Group({
    required this.id,
    required this.title,
    this.image, // Nullable
    required this.stage,
    this.docId, // Nullable
    required this.createdAt,
    required this.updatedAt,
    this.categoryId, // Nullable
    this.description, // Nullable
    this.deadline, // Nullable
    required this.users,
  });

  factory Group.fromJson(Map<String, dynamic> json) {
    return Group(
      id: json['id'],
      title: json['title'],
      image: json['image'], // No forced conversion
      stage: json['stage'],
      docId: json['doc_id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      categoryId: json['category_id']?.toString(), // Handle null
      description: json['description'],
      deadline: json['deadline'],
      users: (json['users'] as List).map((e) => User.fromJson(e)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'image': image,
      'stage': stage,
      'doc_id': docId,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'category_id': categoryId,
      'description': description,
      'deadline': deadline,
      'users': users.map((e) => e.toJson()).toList(),
    };
  }
}

class User {
  final int id;
  final String name;
  final String email;
  final String? emailVerifiedAt;
  final String createdAt;
  final String updatedAt;
  final String type;
  final String? phone;
  final String? userId;
  final String? avatar;
  final Pivot pivot;

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
      emailVerifiedAt: json['email_verified_at'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      type: json['type'],
      phone: json['phone'],
      userId: json['user_id'],
      avatar: json['avatar'],
      pivot: Pivot.fromJson(json['pivot']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'email_verified_at': emailVerifiedAt,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'type': type,
      'phone': phone,
      'user_id': userId,
      'avatar': avatar,
      'pivot': pivot.toJson(),
    };
  }
}

class Pivot {
  final int groupId;
  final int userId;
  final String position;

  Pivot({required this.groupId, required this.userId, required this.position});

  factory Pivot.fromJson(Map<String, dynamic> json) {
    return Pivot(
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

SingleGroupModel groupModelFromJson(String str) =>
    SingleGroupModel.fromJson(json.decode(str));

String groupModelToJson(SingleGroupModel data) => json.encode(data.toJson());
