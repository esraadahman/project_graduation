import 'package:gradution_project/Core/Imports/common_imports.dart';

class AllTasks {
  final List<Task> tasks;

  AllTasks({required this.tasks});

  factory AllTasks.fromJson(dynamic source) {
    if (source is String) {
      return AllTasks.fromMap(json.decode(source));
    } else if (source is Map<String, dynamic>) {
      return AllTasks.fromMap(source);
    } else {
      throw Exception("Invalid data format for AllTasks.fromJson");
    }
  }

  factory AllTasks.fromMap(Map<String, dynamic> map) {
    return AllTasks(
      tasks: List<Task>.from((map['tasks'] ?? []).map((x) => Task.fromMap(x))),
    );
  }
}

class Task {
  final int id;
  final String title;
  final String status;
  final String level;
  final String description;
  final String startDate;
  final String deadlineDate;
  final int authorId;
  final List<User> assignedTo;
  final int groupId;
  final String createdAt;
  final String updatedAt;
  final User author;

  Task({
    required this.id,
    required this.title,
    required this.status,
    required this.level,
    required this.description,
    required this.startDate,
    required this.deadlineDate,
    required this.authorId,
    required this.assignedTo,
    required this.groupId,
    required this.createdAt,
    required this.updatedAt,
    required this.author,
  });

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'] ?? 0,
      title: map['title'] ?? '',
      status: map['status'] ?? '',
      level: map['Urgency'] ?? '',
      description: map['description'] ?? '',
      startDate: map['start_date'] ?? '',
      deadlineDate: map['deadline_date'] ?? '',
      authorId: map['author_id'] ?? 0,
      assignedTo: map['assigned_to'] is List
          ? List<User>.from(
              (map['assigned_to'] as List).map((x) => User.fromMap(x)),
            )
          : [],
      groupId: map['group_id'] ?? 0,
      createdAt: map['created_at'] ?? '',
      updatedAt: map['updated_at'] ?? '',
      author: User.fromMap(map['author'] ?? {}),
    );
  }
}

class User {
  final int id;
  final String name;
  final String email;
  final String? emailVerifiedAt;
  final String? createdAt;
  final String? updatedAt;
  final String? type;
  final String? phone;
  final int? userId;
  final String? avatar;

  User({
    required this.id,
    required this.name,
    required this.email,
    this.emailVerifiedAt,
    this.createdAt,
    this.updatedAt,
    this.type,
    this.phone,
    this.userId,
    this.avatar,
  });

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] ?? 0,
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      emailVerifiedAt: map['email_verified_at'],
      createdAt: map['created_at'],
      updatedAt: map['updated_at'],
      type: map['type'],
      phone: map['phone'],
      userId: map['user_id'],
      avatar: map['avatar'],
    );
  }
}
