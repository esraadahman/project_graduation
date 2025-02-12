import 'package:flutter/cupertino.dart';
import 'package:project_graduation/Core/Imports/common_imports.dart';

class Workspaces extends StatefulWidget {
  const Workspaces({super.key});

  @override
  State<Workspaces> createState() => _WorkspacesState();
}

class _WorkspacesState extends State<Workspaces> {
  String dropdownValue = 'Category';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          WorkSpacesCubit(Userrepo(api: DioConsumer(dio: Dio())))
            ..getAllGroups(),
      child: BlocConsumer<WorkSpacesCubit, WorkSpacesState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            backgroundColor: ColorsClass.background,
            appBar: HeaderTitle(
              title: "Work Spaces",
              onMorePressed: () {},
            ),
            body: Column(children: [
              size.height(10),
              Container(
                width: width(context),
                height: 2.h,
                color: ColorsClass.lightGrey,
              ),
              size.height(30),
              Row(
                children: [
                  size.width(13),
                  const WorkSpaceButtonWidget(
                    image: "assets/images/tabler_progress.svg",
                    innerText: "In Progress",
                    grad: true,
                    border: false,
                    progress: true,
                    active: true,
                  ),
                  size.width(20),
                  const WorkSpaceButtonWidget(
                    image: "assets/images/tabler_progress-check.svg",
                    innerText: "Done",
                    grad: false,
                    border: true,
                    progress: false,
                    active: false,
                  ),
                ],
              ),
              size.height(32),
              Container(
                height: 50.h,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  //shrinkWrap: true,
                  children: [
                    size.width(13),
                    WorkSpaceButton2Widget(
                      image: "assets/images/add.svg",
                      innerText: "New Work Space",
                      border: true,
                      newWorkSpace: true,
                      onclick: () {
                        context.navigateTo(BasicsScreen());
                      },
                    ),
                    size.width(8),
                    WorkSpaceButton2Widget(
                      image: "assets/images/Filter.svg",
                      innerText: "Filter",
                      border: false,
                      newWorkSpace: false,
                      onclick: () {
                        if (state is WorkSpacesSuccess) {
                          context
                              .read<WorkSpacesCubit>()
                              .sortGroupsByName(state.response.data);
                        }
                      },
                    ),
                    size.width(5),
                    WorkSpaceButton2Widget(
                      image: "assets/images/Swap.svg",
                      innerText: "Sort",
                      border: false,
                      newWorkSpace: false,
                      onclick: () {
                        if (state is WorkSpacesSuccess) {
                          context
                              .read<WorkSpacesCubit>()
                              .sortGroupsByDate(state.response.data);
                        }
                      },
                    ),
                  ],
                ),
              ),
              size.height(26),
              state is WorkSpacesSuccess
                  ? Expanded(
                      child: ListView.separated(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: state.response.data.length,
                        itemBuilder: (context, index) {
                          final group = state.response.data[index].group;
                          final cubit = context.read<WorkSpacesCubit>();

                          cubit.getname_of_image(group.image ?? '');
                          return Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  context.navigateTo(Workspace(id: group.id));
                                },
                                child: containerOFImageOFWorkSpace(
                                  image: group.image != null
                                      ? "${EndPoint.baseUrl}${group.image}"
                                      : '',
                                  title: group.title,
                                  date: formateDate(group.createdAt),
                                  numMembers: group.users.length,
                                  imagelist: group.users
                                      .map((user) => user.avatar ?? "")
                                      .toList(), // List of avatars
                                ),
                              ),
                              iconsRowWidget(
                                filesIcon: () {},
                                chatIcon: () {},
                              ),
                            ],
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(height: 20);
                        },
                      ),
                    )
                  : state is WorkSpacesLoading
                      ? Center(
                          child: SizedBox(
                            width: 40.0, // Radius of 20.0
                            height: 250.0,
                            child: ColorFiltered(
                              colorFilter: ColorFilter.mode(
                                CupertinoColors
                                    .activeBlue, // Set the color to active blue
                                BlendMode.srcIn,
                              ),
                              child: CupertinoActivityIndicator(
                                radius: 20.0, // Custom radius
                              ),
                            ),
                          ),
                        )
                      : Center(child: Text("Failed")),
            ]),
          );
        },
      ),
    );
  }
}

List<String> listimages_member = [
  'https://th.bing.com/th/id/OIP.awAiMS1BCAQ2xS2lcdXGlwHaHH?w=203&h=195&c=7&r=0&o=5&dpr=1.3&pid=1.7',
  'https://th.bing.com/th/id/OIP.awAiMS1BCAQ2xS2lcdXGlwHaHH?w=203&h=195&c=7&r=0&o=5&dpr=1.3&pid=1.7',
  'https://th.bing.com/th/id/OIP.awAiMS1BCAQ2xS2lcdXGlwHaHH?w=203&h=195&c=7&r=0&o=5&dpr=1.3&pid=1.7',
  'https://th.bing.com/th/id/OIP.awAiMS1BCAQ2xS2lcdXGlwHaHH?w=203&h=195&c=7&r=0&o=5&dpr=1.3&pid=1.7',
  'https://th.bing.com/th/id/OIP.awAiMS1BCAQ2xS2lcdXGlwHaHH?w=203&h=195&c=7&r=0&o=5&dpr=1.3&pid=1.7'
];

List<String> images_workSpaces = [
  'assets/images/1ab471030b838de8779c72071bcdc281.png',
  '',
  'assets/images/1ab471030b838de8779c72071bcdc281.png',
  'assets/images/1ab471030b838de8779c72071bcdc281.png',
  '',
  'assets/images/1ab471030b838de8779c72071bcdc281.png',
];
