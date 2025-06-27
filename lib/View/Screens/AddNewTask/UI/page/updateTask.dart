import 'package:gradution_project/Core/Imports/common_imports.dart';

class Updatetask extends StatefulWidget {
  const Updatetask(
      {super.key,
      required this.groupId,
      required this.TaskId,
      required this.title,
      required this.status,
      required this.deadline,
      required this.description});

  final int groupId;
  final int TaskId;
  final String title;
  final String status;
  final String deadline;
  final String description;

  @override
  State<Updatetask> createState() => _AddNewTaskState();
}

class _AddNewTaskState extends State<Updatetask> {
  @override
  Widget build(BuildContext context) {
    void handleFormSubmit({
      required String title,
      required String assignedMember,
      required String urgencyLevel,
      required String description,
      required String deadline,
    }) {
      print('Title: $title');
      print('Assigned: $assignedMember');
      print('Urgency: $urgencyLevel');
      print('Description: $description');
      print('Deadline: $deadline');
    }

    return BlocProvider(
      create: (context) => AddTaskCubit(Userrepo(api: DioConsumer(dio: Dio())))
        ..getGroupMember(widget.groupId),
      child: BlocConsumer<AddTaskCubit, AddTaskState>(
        listener: (context, state) {
          if (state is TaskUpdateSuccess) {
            showTopSnackBar(
              Overlay.of(context),
              const CustomSnackBar.info(
                message: 'Task  Updated  successfuly',
              ),
            );
            context.navigateTo(Workspace(
              id: widget.groupId,
            ));
          }
          if (state is TaskUpdateFailure) {
            showTopSnackBar(
              Overlay.of(context),
              const CustomSnackBar.error(
                message: "Some thing Wrong",
              ),
            );
            //  context.navigateTo(const SubmitconfirmScreen());
          }
        },
        builder: (context, state) {
          final cubit = BlocProvider.of<AddTaskCubit>(context);
          return Scaffold(
            backgroundColor: ColorsClass.colorwhite,
            appBar: HeaderTitle(
              title: "Update Task",
              onMorePressed: () {},
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  size.height(height(context) * .05),
                  Textfiledswidget(
                    buttonText: (state is TaskUpdatingLoading)
                        ? "Loading..."
                        : "Finish",
                    iupdate: true,
                    labelText: "Title",
                    hintText: widget.title,
                    description: widget.description,
                    urgencyLevel: widget.status,
                    deadline: widget.deadline,
                    items: state is MembersLoaded
                        ? state.members.members.map((e) => e.name).toList()
                        : [],
                    onNext: ({
                      required String title,
                      required int assignedMember,
                      required String urgencyLevel,
                      required String description,
                      required String deadline,
                    }) {
                      print('Title: $title');
                      print('Assigned: $assignedMember');
                      print('Urgency: $urgencyLevel');
                      print('Description: $description');
                      print('Deadline: $deadline');
                      cubit.UpdateTask(
                        title: title,
                        des: description,
                        urgencyLevel: urgencyLevel,
                        assignedMember: 2,
                        deadline: deadline,
                        group_id: widget.groupId,
                        idtask: widget.TaskId,
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
