import 'package:gradution_project/Core/Imports/common_imports.dart';
import 'package:gradution_project/View/Screens/AddChallenge/cubit/cubit/add_challenge_cubit.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class Addchallenge extends StatefulWidget {
  Addchallenge(
      {super.key,
      required this.taskid,
      required this.group_id,
      this.title,
      this.description,
      required this.update,
      this.challengeid});
  final int taskid;
  final int group_id;
  String? title;
  String? description;
  int? challengeid;
  final bool update;
  @override
  State<Addchallenge> createState() => _AddchallengeState();
}

class _AddchallengeState extends State<Addchallenge> {
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;

  initState() {
    super.initState();
    print("task title ${widget.title}");
    print("task description ${widget.description}");
    _titleController = TextEditingController(text: widget.title ?? '');
    _descriptionController =
        TextEditingController(text: widget.description ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AddChallengeCubit(Userrepo(api: DioConsumer(dio: Dio()))),
      child: BlocConsumer<AddChallengeCubit, AddChallengeState>(
        listener: (context, state) {
          if (state is TaskCubitAddChallangeSuccess) {
            showTopSnackBar(
              Overlay.of(context),
              const CustomSnackBar.info(
                message: 'Challange  created  successfuly',
              ),
            );
            context.navigateTo(Workspace(id: widget.group_id));
          }
          if (state is TaskCubitupdateChallangeSuccess) {
            showTopSnackBar(
              Overlay.of(context),
              const CustomSnackBar.info(
                message: 'Challange  Updated  successfuly',
              ),
            );
            context.navigateTo(Workspace(id: widget.group_id));
          }
          if (state is TaskCubitAddChallangeFail ||
              state is TaskCubitupdateChallangeFail) {
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
          final cubit = BlocProvider.of<AddChallengeCubit>(context);
          return Scaffold(
            backgroundColor: ColorsClass.colorwhite,
            appBar: HeaderTitle(
              title: "New Challenge",
              onMorePressed: () {},
            ),
            body: Container(
              width: width(context) * 0.9,
              margin: EdgeInsets.only(
                  left: width(context) * .05, right: width(context) * .05),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    size.height(50),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text('Title',
                          style: styling.subtitle.copyWith(
                              color: ColorsClass.password_text, fontSize: 14)),
                    ),
                    size.height(5),
                    SizedBox(
                      width: width(context),
                      height: height(context) * .07,
                      child: TextFormField(
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide(
                                    color: ColorsClass.border_color, width: 1)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide(
                                    color: ColorsClass.border_color, width: 1)),
                            hintText: widget.title ??
                                "Please enter your challenge title",
                            hintStyle: styling.subtitle.copyWith(
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                              color: ColorsClass.sub_text,
                            )),
                        controller: _titleController,
                      ),
                    ),
                    size.height(40),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text("Description",
                          style: styling.subtitle.copyWith(
                              color: ColorsClass.password_text, fontSize: 14)),
                    ),
                    size.height(5),
                    SizedBox(
                      width: width(context),
                      height: height(context) * .25,
                      child: TextFormField(
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide(
                                    color: ColorsClass.border_color, width: 1)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide(
                                    color: ColorsClass.border_color, width: 1)),
                            hintText: widget.description ??
                                "Please enter your challenge description",
                            hintStyle: styling.subtitle.copyWith(
                                fontWeight: FontWeight.normal,
                                fontSize: 14,
                                color: ColorsClass.sub_text)),
                        controller: _descriptionController,
                        minLines: 7,
                        maxLines: 10,
                      ),
                    ),
                    size.height(120),
                    Confirmbutton(
                        text: widget.update ? "Update" : "ADD",
                        onTap: () {
                          if (_titleController.text.isNotEmpty &&
                              _descriptionController.text.isNotEmpty) {
                            if (widget.update) {
                              cubit.UpdateTaskChallange(
                                title: _titleController.text,
                                des: _descriptionController.text,
                                challengeid: widget.challengeid!,
                              );
                            } else {
                              cubit.AddTaskChallange(
                                title: _titleController.text,
                                des: _descriptionController.text,
                                taskid: widget.taskid,
                              );
                            }
                          }
                        }),
                    size.height(20),
                    SizedBox(
                      width: width(context) / 1.3,
                      height: height(context) / 1.4 / 15,
                      child: Confirmbuttonprimary(
                          text: "Cancel",
                          onTap: () {
                            context.goBack();
                          }),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
