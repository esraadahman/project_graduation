import 'dart:convert';

class AllGroups {
  final bool status;
  final List<GroupData> data;
  final int numberOfGroups;

  AllGroups({
    required this.status,
    required this.data,
    required this.numberOfGroups,
  });

  factory AllGroups.fromJson(dynamic source) {
    if (source is String) {
      return AllGroups.fromMap(json.decode(source));
    } else if (source is Map<String, dynamic>) {
      return AllGroups.fromMap(source);
    } else {
      throw Exception("Invalid data format for AllGroups.fromJson");
    }
  }

  factory AllGroups.fromMap(Map<String, dynamic> map) {
    return AllGroups(
      status: map['status'] ?? false,
      data: List<GroupData>.from(
          (map['data'] as List<dynamic>? ?? []).map((x) => GroupData.fromMap(x))),
      numberOfGroups: map['numberOfGroups'] ?? 0,
    );
  }
}

class GroupData {
  final Group group;

  GroupData({required this.group});

  factory GroupData.fromMap(Map<String, dynamic> map) {
    return GroupData(
      group: Group.fromMap(map['group'] ?? {}),
    );
  }
}

class Group {
  final int id;
  final String title;
  final String? image;
  final String? description;
  final String? category;
  final List<User> users;
  final Pivot? pivot;
  final String createdAt;
  final String updatedAt;

  Group({
    required this.id,
    required this.title,
    this.image,
    this.description,
    this.category,
    required this.users,
    this.pivot,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Group.fromMap(Map<String, dynamic> map) {
    return Group(
      id: map['id'] ?? 0,
      title: map['title'] ?? '',
      image: map['image'], // `image` can be null, so it's String?
      description: map['description'],
      category: map['category'],
      users: List<User>.from(
          (map['users'] as List<dynamic>? ?? []).map((x) => User.fromMap(x))),
      pivot: map['pivot'] != null ? Pivot.fromMap(map['pivot']) : null,
      createdAt: map['created_at'] ?? '',
      updatedAt: map['updated_at'] ?? '',
    );
  }
}

class User {
  final int id;
  final String name;
  final String email;
  final String? emailVerifiedAt;
  final String? phone;
  final String? avatar;
  final Pivot? pivot;

  User({
    required this.id,
    required this.name,
    required this.email,
    this.emailVerifiedAt,
    this.phone,
    this.avatar,
    this.pivot,
  });

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] ?? 0,
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      emailVerifiedAt: map['email_verified_at'],
      phone: map['phone'],
      avatar: map['avatar'],
      pivot: map['pivot'] != null ? Pivot.fromMap(map['pivot']) : null,
    );
  }
}

class Pivot {
  final int groupId;
  final int userId;
  final String? position;

  Pivot({required this.groupId, required this.userId, this.position});

  factory Pivot.fromMap(Map<String, dynamic> map) {
    return Pivot(
      groupId: map['group_id'] ?? 0,
      userId: map['user_id'] ?? 0,
      position: map['position'],
    );
  }
}
