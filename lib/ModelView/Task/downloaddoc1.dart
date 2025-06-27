class Downloaddoc1Model {
  final List<TaskItem> tasks;

  Downloaddoc1Model({required this.tasks});

  factory Downloaddoc1Model.fromJson(Map<String, dynamic> json) {
    return Downloaddoc1Model(
      tasks: List<TaskItem>.from(json['tasks'].map((item) => TaskItem.fromJson(item))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'tasks': tasks.map((item) => item.toJson()).toList(),
    };
  }
}

class TaskItem {
  final String task;

  TaskItem({required this.task});

  factory TaskItem.fromJson(Map<String, dynamic> json) {
    return TaskItem(
      task: json['task'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'task': task,
    };
  }
}
