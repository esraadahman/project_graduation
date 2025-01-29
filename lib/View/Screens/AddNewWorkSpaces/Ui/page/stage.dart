import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:project_graduation/Core/Imports/common_imports.dart';
import 'package:project_graduation/View/Screens/AddNewWorkSpaces/Ui/page/Basics.dart';
import 'package:project_graduation/View/Screens/AddNewWorkSpaces/Ui/page/submitConfirm.dart';
import 'package:project_graduation/View/Screens/AddNewWorkSpaces/cubit/cubit/add_workspace_cubit.dart';
import 'package:project_graduation/repo/UserRepo.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class StageScreen extends StatelessWidget {
  StageScreen({super.key});
  final HiveConstants hiveService = HiveConstants();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AddWorkspaceCubit(Userrepo(api: DioConsumer(dio: Dio()))),
      child: BlocConsumer<AddWorkspaceCubit, AddWorkspaceState>(
        listener: (context, state) {
          if (state is AddWorkspaceSuccess) {
            showTopSnackBar(
              Overlay.of(context),
              const CustomSnackBar.info(
                message: 'Work space  created  successfuly',
              ),
            );
            context.navigateTo(SubmitconfirmScreen());
          }
            if (state is AddWorkspaceFailed) {
            showTopSnackBar(
              Overlay.of(context),
              const CustomSnackBar.error(
                message: "Some thing Wrong",
              ),
            
            );
            context.navigateTo(SubmitconfirmScreen());
          }
        },
        builder: (context, state) {
          final cubit = BlocProvider.of<AddWorkspaceCubit>(context);

          return Scaffold(
              backgroundColor: ColorsClass.colorwhite,
              appBar: HeaderTitle(
                title: "Add New Work Space",
                onMorePressed: () {},
              ),
              body: SingleChildScrollView(
                  child: Column(children: [
                size.height(height(context) * .05),
                SizedBox(
                  width: width(context),
                  height: height(context) * .17,
                  child: const ProgressBarWidget(
                    activeIndex: 1,
                  ),
                ),
                Radiobutton(
                  onStageSelected: (String stage) {
                    print(stage);
                    cubit.workSpaceStage.text = stage;
                  },
                ),
                size.height(10),
                Padding(
                  padding: EdgeInsets.only(
                    left: width(context) * .03,
                  ),
                  child: const GradientCheckBoxWidget(
                      text:
                          'Use AI Suggestions to guide you throw work\n space creation'),
                ),
                size.height(40),
                MediaScreen(
                  ontap1: cubit.pickFiles,
                ),
                size.height(40),
                Container(
                  width: width(context) * 0.9,
                  margin: EdgeInsets.only(
                      left: width(context) * .05, right: width(context) * .05),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text("Deadline",
                            style: styling.subtitle.copyWith(
                                color: ColorsClass.password_text,
                                fontSize: 14)),
                      ),
                      size.height(10),
                      TextField(
                        controller: cubit.workSpaceDeadline,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: const BorderSide(
                                  color: ColorsClass.border_color, width: 1)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: const BorderSide(
                                  color: ColorsClass.border_color, width: 1)),
                          labelText: 'Choose your project deadline ',
                          labelStyle: styling.subtitle.copyWith(
                              color: ColorsClass.password_text,
                              fontSize: width(context) / 30,
                              fontWeight: FontWeight.normal),
                          suffixIcon: IconButton(
                            icon: Icon(
                              Icons.date_range_outlined,
                              color: ColorsClass.password_text,
                              size: width(context) / 14,
                            ),
                            onPressed: () => cubit.selectDate(context),
                          ),
                          border: OutlineInputBorder(),
                        ),
                        readOnly: true,
                      ),
                    ],
                  ),
                ),
                size.height(40),
                Confirmbutton(
                    text:(state is AddWorkspeLoading) ? "Loading...": "Finish",
                    onTap: () {
                      cubit.createNewWorkspace();
                    }),
                size.height(20),
                Confirmbuttonprimary(
                    text: "Back",
                    onTap: () {
                      context.navigateTo(BasicsScreen());
                    }),
                size.height(40),
              ])));
        },
      ),
    );
  }
}
