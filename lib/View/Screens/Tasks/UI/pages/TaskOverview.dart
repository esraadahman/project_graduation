import 'package:gradution_project/Core/Imports/common_imports.dart';

class Taskoverview extends StatefulWidget {
  const Taskoverview(
      {super.key,
      required this.title,
      required this.status,
      required this.deadline,
      required this.description,
      required this.presnt,
      required this.groupId,
      required this.TaskId,
      required this.onclick,
      required this.onclick2});
  final int groupId;
  final int TaskId;
  final String title;
  final String status;
  final String deadline;
  final String description;
  final int presnt;
  final VoidCallback onclick;
  final VoidCallback onclick2;

  @override
  State<Taskoverview> createState() => _TaskoverviewState();
}

class _TaskoverviewState extends State<Taskoverview> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: SingleChildScrollView(
        child: Column(
          children: [
            TaskName(
              title: widget.title,
            ),
            size.height(20),
            StatusRow(
              items: ['ToDo', 'Ongoing', 'Done'],
              initialValue: widget.status, // e.g. 'ongoing'
              onChanged: (status) => widget.onclick2(),
              onclick: widget.onclick,
            ),
            const SizedBox(height: 30),
            DeadLineRow(
              deadline: widget.deadline,
            ),
            const SizedBox(height: 30),
            DescriptionWidget(
              onclick: () {
                context.navigateTo(
                  Updatetask(
                    groupId: widget.groupId,
                    TaskId: widget.TaskId,
                    title: widget.title,
                    status: widget.status,
                    deadline: widget.deadline,
                    description: widget.description,
                  ),
                );
              },
              des: widget.description,
            ),
            ProgressBar(
              presnt: widget.presnt,
            ),
            size.height(20),
            TeamMembersWidget(),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
