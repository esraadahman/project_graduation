import 'package:flutter/material.dart';
import 'package:gradution_project/Core/Imports/common_imports.dart';
import 'package:gradution_project/ModelView/AllTasks/AllTasks.dart';
import 'package:gradution_project/View/Screens/Tasks/UI/pages/Task.dart';
import 'package:gradution_project/View/Screens/WorkSpace/Ui/widgets/TaskDetailsPage.dart';
// adjust import

class TaskList extends StatelessWidget {
  final String selectedFilter;
  final List<Task> tasks;
  final int groupId;


  const TaskList({
    required this.selectedFilter,
    required this.tasks,
    Key? key,
    required this.groupId,
   
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final filteredTasks = tasks.where((task) {
      if (selectedFilter == "All") return true;
      return task.level == selectedFilter;
    }).toList();

    return Column(
      children: filteredTasks.map((task) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: InkWell(
            borderRadius: BorderRadius.circular(8),
            onTap: () {
              context.navigateTo(TaskPage(
                  groupId: groupId,
                  TaskId: task.id,
                  taskname: task.title,
                  title: task.title,
                  status: task.level,
                  deadline: task.deadlineDate,
                  description: task.description));
            },
            child: TaskCard(
              title: task.title,
              status: task.level,
              deadline: task.deadlineDate,
              progress: 50.0,
              assignees: task.assignedTo.map((u) => u.name).toList(),
              attachments: task.assignedTo.length,
              comments: 5,
            ),
          ),
        );
      }).toList(),
    );
  }
}
