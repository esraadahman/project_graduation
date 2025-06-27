import 'package:gradution_project/Core/Imports/common_imports.dart';

class SubmitconfirmScreen extends StatelessWidget {
  const SubmitconfirmScreen({super.key, required this.groupId});

  final int groupId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AddWorkspaceCubit(Userrepo(api: DioConsumer(dio: Dio())))
            ..getAllUsers(),
      child: BlocConsumer<AddWorkspaceCubit, AddWorkspaceState>(
        listener: (context, state) {
          if (state is InviteUsersSuccess) {
            showTopSnackBar(
              Overlay.of(context),
              const CustomSnackBar.info(
                message: 'Work space  created  successfuly',
              ),
            );
            context.navigateTo(const Workspaces());
          }
          if (state is InviteUsersFailed) {
            showTopSnackBar(
              Overlay.of(context),
              const CustomSnackBar.error(
                message: "Some thing Wrong",
              ),
            );
          }
          if (state is InviteUserAlreadyInGroup) {
            showTopSnackBar(
              Overlay.of(context),
              const CustomSnackBar.error(
                message: "User is already in the group",
              ),
            );

            context.navigateTo(Workspace(id: groupId));
          }
        },
        builder: (context, state) {
          final cubit = BlocProvider.of<AddWorkspaceCubit>(context);
          return Scaffold(
            backgroundColor: ColorsClass.colorwhite,
            body: SafeArea(
                child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: height(context) * 0.05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Textwidget(),
                    size.height(40),
                    state is GetAllUsersLoading
                        ? const Center(child: CircularProgressIndicator())
                        : state is GetAllUsersSuccess
                            ? InviteTeamWidget(
                                onTap: () {},
                                labelText: 'Invite your team members',
                                hintText: "Enter your team members'",
                                userList:
                                    // allUsersList,
                                    state.users,
                                onUserSelected: (user) {
                                  print('Selected user: ${user.name}');
                                  cubit.InviteUsersToGroup(user.id, groupId);
                                },
                              )
                            : const Text("Failed to load users"),
                    // const CopyLinkButton(
                    //   text: "esraa",
                    // ),
                    size.height(50),
                    Confirmbutton(
                        text: "Get Started  ➔",
                        onTap: () {
                          context.navigateTo(const Workspaces());
                        }),
                    size.height(15),
                    emailCallWidget(
                      onTap: () {
                        print('Email clicked');
                      },
                    ),
                  ],
                ),
              ),
            )),
          );
        },
      ),
    );
  }
}
