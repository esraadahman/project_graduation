/// Model for Update Task Status API response

class UpdateStatus {
  final String message;
  final TaskData task;

  UpdateStatus({
    required this.message,
    required this.task,
  });

  factory UpdateStatus.fromJson(Map<String, dynamic> json) {
    return UpdateStatus(
      message: json['message'] as String,
      task: TaskData.fromMap(json['task'] as Map<String, dynamic>),
    );
  }
}

class TaskData {
  final int id;
  final String title;
  final String status;
  final String level;
  final String urgency;
  final String description;
  final String? startDate;
  final String deadlineDate;
  final int authorId;
  final int assignedTo;
  final int groupId;
  final DateTime createdAt;
  final DateTime updatedAt;

  TaskData({
    required this.id,
    required this.title,
    required this.status,
    required this.level,
    required this.urgency,
    required this.description,
    this.startDate,
    required this.deadlineDate,
    required this.authorId,
    required this.assignedTo,
    required this.groupId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory TaskData.fromMap(Map<String, dynamic> map) {
    return TaskData(
      id: map['id'] as int,
      title: map['title'] as String,
      status: map['status'] as String,
      level: map['level'] as String,
      urgency: map['Urgency'] as String,
      description: map['description'] as String,
      startDate: map['start_date'] as String?,
      deadlineDate: map['deadline_date'] as String,
      authorId: map['author_id'] as int,
      assignedTo: map['assigned_to'] as int,
      groupId: map['group_id'] as int,
      createdAt: DateTime.parse(map['created_at'] as String),
      updatedAt: DateTime.parse(map['updated_at'] as String),
    );
  }
}
