import 'package:flutter/cupertino.dart';
import 'package:gradution_project/Core/Imports/common_imports.dart';
import 'package:gradution_project/Core/api/dio_consumer.dart';

class Workspace extends StatefulWidget {
  final int id;
  const Workspace({super.key, required this.id});

  @override
  State<Workspace> createState() => _WorkspaceState();
}

class _WorkspaceState extends State<Workspace> {
  final List<String> filters = ["All", "Urgent", "Normal", "Later"];
  String selectedFilter = "All"; // Default filter

  final List<Map<String, dynamic>> taskCategories = [
    {"title": "Today's Tasks", "count": 3},
    {"title": "Upcoming Tasks", "count": 2},
    {"title": "Completed Tasks", "count": 3},
  ];
  int selectedCategoryIndex = 0; // Default selected category

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          WorkSpaceCubit(Userrepo(api: DioConsumer(dio: Dio())))
            ..getAllData(widget.id),
      // ..getGroupById(widget.id)
      // ..getGroupTasks(widget.id),
      child: BlocConsumer<WorkSpaceCubit, WorkSpaceState>(
        listener: (context, state) {
          if (state is DeleteWorkSpaceSuccess) {
            showTopSnackBar(
              Overlay.of(context),
              const CustomSnackBar.info(
                message: 'Work space  delete  successfuly',
              ),
            );

            context.navigateTo(Workspaces());
          }
        },
        builder: (context, state) {
          final cubit = BlocProvider.of<WorkSpaceCubit>(context);
          return Scaffold(
            appBar: HeaderTitle(
              title: "Work Space",
              onMorePressed: () {},
            ),
            body: SingleChildScrollView(
              child: state is WorkSpaceLoading
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
                  : state is WorkSpaceSuccess
                      ? Container(
                          width: width(context),
                          decoration: BoxDecoration(
                            color: ColorsClass.background,
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          padding: EdgeInsets.only(left: 5, right: 5),
                          child: Column(
                            children: [
                              size.height(15),
                              HeadingTextWidget(
                                text: state.groupDetails.group.title,
                              ),
                              size.height(15),
                              Container(
                                height: height(context) * .3,
                                width: width(context) * .9,
                                decoration: BoxDecoration(
                                  gradient: ColorsClass.workSpaceBackground,
                                  borderRadius: BorderRadius.circular(15.r),
                                  border: null,
                                ),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      bottom: height(context) * .24,
                                      right: width(context) * .07,
                                      child: Transform.scale(
                                        scale: 0.7,
                                        child: iconsRowWidget(
                                          filesIcon: () {},
                                          chatIcon: () {},
                                          spacing: 7,
                                          smallOrnot: false,
                                        ),
                                      ),
                                    ),
                                    InformationWorkspace(
                                      title: state.groupDetails.group.title,
                                      category: "Category",
                                      onpointsClick: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return ChallengeActionDialog(
                                              onDelete: () {
                                                cubit.deleteGroup(widget.id);
                                              },
                                              onUpdate: () {
                                                Navigator.of(context).pop();
                                              },
                                            );
                                          },
                                        );
                                      },
                                      shareclick: () {
                                        context.navigateTo(
                                          Invitememebers(
                                            groupId: widget.id,
                                          ),
                                        );
                                      },
                                    ),
                                    Positioned(
                                        bottom: 20,
                                        left: 15,
                                        child: Row(
                                          children: [
                                            TextBottom(
                                              maintext: "CREATED",
                                              subtext: formateDate(state
                                                  .groupDetails
                                                  .group
                                                  .createdAt),
                                            ),
                                            size.width(15),
                                            TextBottom(
                                                maintext: "DEADLINE",
                                                subtext: "Jun 02, 04:01 PM"),
                                            size.width(20),
                                            TextBottom(
                                                maintext: "CURRENT STAGE",
                                                subtext: "Stage Name")
                                          ],
                                        ))
                                  ],
                                ),
                              ),
                              size.height(10),
                              GestureDetector(
                                onTap: () {
                                  context.navigateTo(DocumentationScreen(
                                    groupId: widget.id,
                                  ));
                                },
                                child: Documentation(),
                              ),
                              size.height(20),
                              DescriptionWidget(
                                onclick: () {},
                                des: state.groupDetails.group.description,
                              ),
                              size.height(10),

                              Row(
                                children: [
                                  SizedBox(width: width(context) * .04),
                                  SizedBox(
                                    height: height(context) * .07,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        context.navigateTo(
                                          AddNewTask(
                                            groupId: widget.id,
                                          ),
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: ColorsClass.primary,
                                        padding: EdgeInsets.symmetric(
                                          horizontal: width(context) * .045,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          Icon(Icons.add, color: Colors.white),
                                          SizedBox(width: width(context) * .01),
                                          Text(
                                            'New',
                                            style: styling.subtitle.copyWith(
                                              color: Colors.white,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Spacer(),
                                  SortButton(label: "Time", onPressed: () {}),
                                  SizedBox(width: width(context) * .04),
                                ],
                              ),

                              SizedBox(height: 20),

                              /// **Filter Section**
                              TaskFilterWidget(
                                filters: filters,
                                selectedFilter: selectedFilter,
                                onFilterSelected: (filter) {
                                  setState(() {
                                    selectedFilter = filter;
                                  });
                                },
                              ),

                              SizedBox(height: 20),

                              /// **Task Categories Section**
                              TaskCategoriesWidget(
                                taskCategories: taskCategories,
                                selectedCategoryIndex: selectedCategoryIndex,
                                onCategorySelected: (index) {
                                  setState(() {
                                    selectedCategoryIndex = index;
                                  });
                                },
                              ),

                              SizedBox(height: 20),

                              TaskList(
                                  groupId: widget.id,
                                  selectedFilter: selectedFilter,
                                  tasks: state.TasksDetails.tasks),
                            ],
                          ),
                        )
                      : Center(child: Text("Failed")),
            ),
          );
        },
      ),
    );
  }
}
