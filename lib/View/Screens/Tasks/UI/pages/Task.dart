import 'package:flutter/cupertino.dart';
import 'package:gradution_project/Core/Imports/common_imports.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class TaskPage extends StatefulWidget {
  const TaskPage(
      {super.key,
      required this.taskname,
      required this.title,
      required this.status,
      required this.deadline,
      required this.description,
      required this.groupId,
      required this.TaskId});
  final int groupId;
  final int TaskId;
  final String taskname;
  final String title;
  final String status;
  final String deadline;
  final String description;
  @override
  State<TaskPage> createState() => _TaskState();
}

class _TaskState extends State<TaskPage> {
  bool active = true;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          TaskCubitCubit(Userrepo(api: DioConsumer(dio: Dio())))
            ..getTaskChallanges(widget.TaskId),
      child: BlocConsumer<TaskCubitCubit, TaskCubitState>(
        listener: (context, state) {
          if (state is TaskCubitDeleteSuccess) {
            showTopSnackBar(
              Overlay.of(context),
              const CustomSnackBar.info(
                message: 'Task  Deleted  successfuly',
              ),
            );
            context.navigateTo(Workspace(
              id: widget.groupId,
            ));
          }
          if (state is TaskCubitDeleteFail) {
            showTopSnackBar(
              Overlay.of(context),
              const CustomSnackBar.error(
                message: "Some thing Wrong",
              ),
            );
            //  context.navigateTo(const SubmitconfirmScreen());
          }
          if (state is ChallangeDeleteSuccess) {
            showTopSnackBar(
              Overlay.of(context),
              const CustomSnackBar.info(
                message: 'Challange  Deleted  successfuly',
              ),
            );
            // context.read<TaskCubitCubit>().resetToInitial();
            final cubit = context.read<TaskCubitCubit>();
            cubit.resetToInitial(); // Reset
            cubit.getTaskChallanges(widget.TaskId); // Refetch
          }
          if (state is ChallangesCubitStatusFail) {
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
          final cubit = BlocProvider.of<TaskCubitCubit>(context);
          return Scaffold(
            backgroundColor: ColorsClass.background,
            appBar: HeaderTitle(
              title: widget.taskname.isNotEmpty
                  ? widget.taskname[0].toUpperCase() +
                      widget.taskname.substring(1)
                  : widget.taskname,
              onMorePressed: () {},
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      TaskButtons(
                        active: active,
                        icon1: "assets/images/progress-clock.svg",
                        icon2: "assets/images/progress-clock(unactive).svg",
                        name: "Overview",
                        onclick: () => setState(() {
                          active = !active;
                        }),
                      ),
                      TaskButtons(
                        active: !active,
                        icon1: "assets/images/mingcute_asterisk-line (1).svg",
                        icon2: "assets/images/mingcute_asterisk-line.svg",
                        name: "Challenges",
                        onclick: () => setState(() {
                          active = !active;
                        }),
                      ),
                    ],
                  ),
                  size.height(10),
                  active
                      ? Taskoverview(
                          onclick2: () {
                            cubit.UpdateTaskStatus(
                                widget.groupId, widget.TaskId, widget.status);
                          },
                          onclick: () {
                            cubit.deleteGroup(widget.groupId, widget.TaskId);
                          },
                          groupId: widget.groupId,
                          TaskId: widget.TaskId,
                          title: widget.taskname.isNotEmpty
                              ? widget.taskname[0].toUpperCase() +
                                  widget.taskname.substring(1)
                              : widget.taskname,
                          status: widget.status,
                          deadline: widget.deadline,
                          description: widget.description,
                          presnt: 50,
                        )
                      : state is ChallangesCubitStatusLoading
                          ? const Center(
                              child: SizedBox(
                                width: 40.0, // Radius of 20.0
                                height: 250.0,
                                child: ColorFiltered(
                                  colorFilter: ColorFilter.mode(
                                    CupertinoColors.activeBlue,
                                    BlendMode.srcIn,
                                  ),
                                  child: CupertinoActivityIndicator(
                                    radius: 20.0, // Custom radius
                                  ),
                                ),
                              ),
                            )
                          : state is ChallangesCubitStatusSuccess
                              ? Taskchallenges(
                                  onclick2: (int index) {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return ChallengeActionDialog(
                                          onDelete: () {
                                            print(
                                                "Delete challenge with id: $index");
                                            cubit.deleteChallange(index);
                                          },
                                          onUpdate: () {
                                            context.navigateTo(Addchallenge(
                                              update: true,
                                              taskid: widget.TaskId,
                                              group_id: widget.groupId,
                                              title: state
                                                  .challenges
                                                  .challenges[state
                                                      .challenges.challenges
                                                      .indexWhere((element) =>
                                                          element.id == index)]
                                                  .title,
                                              description: state
                                                  .challenges
                                                  .challenges[state
                                                      .challenges.challenges
                                                      .indexWhere((element) =>
                                                          element.id == index)]
                                                  .solution
                                                  .contents,
                                              challengeid: index,
                                            ));
                                          },
                                        );
                                      },
                                    );
                                  },
                                  onclick: () {
                                    context.navigateTo(Addchallenge(
                                      update: false,
                                      taskid: widget.TaskId,
                                      group_id: widget.groupId,
                                    ));
                                  },
                                  Challenges: state.challenges.challenges)
                              : const Center(
                                  child: Text(
                                    "No Challenges Available",
                                    style: TextStyle(
                                      color: ColorsClass.primary,
                                      fontSize: 16,
                                    ),
                                  ),
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
