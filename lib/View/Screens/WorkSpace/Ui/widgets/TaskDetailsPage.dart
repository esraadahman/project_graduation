import 'package:flutter/material.dart';
import 'package:gradution_project/Core/Imports/common_imports.dart';
import 'package:gradution_project/ModelView/AllTasks/AllTasks.dart';
 // adjust import

class TaskDetailPage extends StatelessWidget {
  final Task task;

  const TaskDetailPage({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(task.title, style: styling.subtitle.copyWith(color: Colors.white)),
        backgroundColor: ColorsClass.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TaskCard(
          title: task.title,
          status: task.level,
          deadline: task.deadlineDate,
          progress: 50.0,  // or use real progress if available
          assignees: task.assignedTo.map((u) => u.name).toList(),
          attachments: task.assignedTo.length,
          comments: 5,
          // disable any onTap inside TaskCard if it has one
        ),
      ),
    );
  }
}
