import 'package:gradution_project/Core/Imports/common_imports.dart';
import 'package:gradution_project/View/Screens/AddNewTask/UI/widgets/TextfiledsWidget.dart';
import 'package:gradution_project/View/Screens/AddNewTask/cubit/cubit/add_task_cubit_cubit.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class AddNewTask extends StatefulWidget {
  const AddNewTask({super.key, required this.groupId});

  final int groupId;

  @override
  State<AddNewTask> createState() => _AddNewTaskState();
}

class _AddNewTaskState extends State<AddNewTask> {
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
          if (state is TaskSuccess) {
            showTopSnackBar(
              Overlay.of(context),
              const CustomSnackBar.info(
                message: 'Task  created  successfuly',
              ),
            );
            context.navigateTo(Workspace(
              id: widget.groupId,
            ));
          }
          if (state is TaskFailure) {
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
              title: "Add New Task",
              onMorePressed: () {},
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  size.height(height(context) * .05),
                  Textfiledswidget(
                    buttonText:
                        (state is TaskSubmitting) ? "Loading..." : "ADD",
                    iupdate: false,
                    labelText: "Title",
                    description: 'please enter your task description',
                    hintText: "Enter your task title",
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
                      cubit.createNewWorkspace(
                        title: title,
                        des: description,
                        urgencyLevel: urgencyLevel,
                        assignedMember: 2,
                        deadline: deadline,
                        group_id: widget.groupId,
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
