/// Models for Create Task API response

/// Wrapper for the response
class CreateTaskResponse {
  final TaskData task;

  CreateTaskResponse({required this.task});

  factory CreateTaskResponse.fromJson(Map<String, dynamic> json) {
    return CreateTaskResponse(
      task: TaskData.fromMap(json['task'] as Map<String, dynamic>),
    );
  }
}

/// The Task object
class TaskData {
  final int id;
  final String title;
  final String description;
  final User assignedTo;
  final String deadlineDate;
  final int groupId;
  final int authorId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final User author;

  TaskData({
    required this.id,
    required this.title,
    required this.description,
    required this.assignedTo,
    required this.deadlineDate,
    required this.groupId,
    required this.authorId,
    required this.createdAt,
    required this.updatedAt,
    required this.author,
  });

  factory TaskData.fromMap(Map<String, dynamic> map) {
    return TaskData(
      id: map['id'] as int,
      title: map['title'] as String,
      description: map['description'] as String,
      assignedTo: User.fromMap(map['assigned_to'] as Map<String, dynamic>),
      deadlineDate: map['deadline_date'] as String,
      groupId: map['group_id'] as int,
      authorId: map['author_id'] as int,
      createdAt: DateTime.parse(map['created_at'] as String),
      updatedAt: DateTime.parse(map['updated_at'] as String),
      author: User.fromMap(map['author'] as Map<String, dynamic>),
    );
  }
}

/// User model
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
  });

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as int,
      name: map['name'] as String,
      email: map['email'] as String,
      emailVerifiedAt: map['email_verified_at'] != null
          ? DateTime.parse(map['email_verified_at'] as String)
          : null,
      createdAt: DateTime.parse(map['created_at'] as String),
      updatedAt: DateTime.parse(map['updated_at'] as String),
      type: map['type'] as String,
      phone: map['phone'] as String?,
      userId: map['user_id'] as int?,
      avatar: map['avatar'] as String?,
    );
  }
}
