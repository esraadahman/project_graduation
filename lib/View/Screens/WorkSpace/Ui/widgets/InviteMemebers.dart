import 'package:gradution_project/Core/Imports/common_imports.dart';


class Invitememebers extends StatelessWidget {
  const Invitememebers({super.key, required this.groupId});

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
                message: 'Invite User  successfuly',
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

            // final cubit = context.read<AddWorkspaceCubit>();
            // Future.delayed(const Duration(microseconds: 1), () {
            //   cubit.getAllUsers();
            // });
            context.navigateTo(Workspace(id: groupId));
          }
        },
        builder: (context, state) {
          final cubit = BlocProvider.of<AddWorkspaceCubit>(context);
          return Scaffold(
            backgroundColor: ColorsClass.colorwhite,
            appBar: AppBar(
              backgroundColor: ColorsClass.colorwhite,
              elevation: 0,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios_new_rounded,
                    color: ColorsClass.text),
                onPressed: () {
                  context.goBack();
                },
              ),
              title: Text("Invite Members",
                  style: styling.maintitle.copyWith(fontSize: 20)),
            ),
            body: SafeArea(
                child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: height(context) * 0.05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    size.height(15),
                    Image.asset("assets/images/love-letter_9365008.png",
                        width: width(context) * 0.5,
                        height: height(context) * 0.3),
                    size.height(height(context) * .03),
                    state is GetAllUsersLoading
                        ? const Center(child: CircularProgressIndicator())
                        : state is GetAllUsersSuccess
                            ? InviteTeamWidget(
                                onTap: () {},
                                labelText: 'Invite your team members',
                                hintText: "Choose your team members",
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
                    size.height(60),
                    Confirmbutton(
                        text: "Invite" ,
                        onTap: () {
                          context.navigateTo(const Workspaces());
                        }),
                    size.height(15),
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
