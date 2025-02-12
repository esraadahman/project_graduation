import 'package:project_graduation/Core/Imports/common_imports.dart';



class TaskList extends StatelessWidget {
  final String selectedFilter;
  final List<Map<String, dynamic>> tasks;

  const TaskList({required this.selectedFilter, required this.tasks, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> filteredTasks = tasks.where((task) {
      if (selectedFilter == "All") return true;
      return task["status"] == selectedFilter;
    }).toList();

    return Column(
      children: filteredTasks.map((task) => TaskCard(
        title: task['title'],
        status: task['status'],
        deadline: task['deadline'],
       progress: (task['progress'] as num).toDouble(),
        assignees: task['assignees'],
        attachments: task['attachments'],
        comments: task['comments'],
      )).toList(),
    );
  }
}
