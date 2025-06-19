class Groupcreate {
  final bool status;
  final Group2? group;

  Groupcreate({
    required this.status,
    required this.group,
  });

  factory Groupcreate.fromJson(Map<String, dynamic> json) {
    return Groupcreate(
      status: json['status'] ?? false,
      group: json['group'] != null ? Group2.fromJson(json['group']) : null,
    );
  }
}

class Group2 {
  final int id;
  final String title;
  final String? image;
  final String description;
  final String deadline;
  final String stage;
  final String updatedAt;
  final String createdAt;

  Group2({
    required this.id,
    required this.title,
    this.image,
    required this.description,
    required this.deadline,
    required this.stage,
    required this.updatedAt,
    required this.createdAt,
  });

  factory Group2.fromJson(Map<String, dynamic> json) {
    return Group2(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      image: json['image'], // can be null
      description: json['description'] ?? '',
      deadline: json['deadline'] ?? '',
      stage: json['stage'] ?? '',
      updatedAt: json['updated_at'] ?? '',
      createdAt: json['created_at'] ?? '',
    );
  }
}
