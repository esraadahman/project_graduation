import 'package:gradution_project/Core/Imports/common_imports.dart';

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
            context.navigateTo(SubmitconfirmScreen(groupId: state.groupId));
          }
          if (state is AddWorkspaceFailed) {
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
                DeadLineWidget(
                  controller: cubit.workSpaceDeadline,
                  onDateTap: () => cubit.selectDate(context),
                  title: "Deadline",
                  labelText: "Choose your project deadline ",
                ),
                size.height(40),
                Confirmbutton(
                    text:
                        (state is AddWorkspeLoading) ? "Loading..." : "Finish",
                    onTap: () {
                      cubit.createNewWorkspace();
                    }),
                size.height(20),
                Confirmbuttonprimary(
                    text: "Back",
                    onTap: () {
                      context.navigateTo(const BasicsScreen());
                    }),
                size.height(40),
              ])));
        },
      ),
    );
  }
}
