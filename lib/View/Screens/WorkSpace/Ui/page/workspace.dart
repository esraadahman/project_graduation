import 'package:flutter/cupertino.dart';
import 'package:project_graduation/Core/Imports/common_imports.dart';
import 'package:project_graduation/View/Screens/WorkSpace/Ui/widgets/dialogWidget.dart';
import 'package:super_context_menu/super_context_menu.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

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

  final List<Map<String, dynamic>> tasks = [
    {
      "title": "Project X dashboard UI design",
      "status": "Ongoing",
      "deadline": "11th - 15th August 2023",
      "progress": 48,
      "assignees": [
        "https://img.freepik.com/free-vector/young-prince-vector-illustration_1308-174367.jpg",
        "https://img.freepik.com/free-psd/3d-rendering-hair-style-avatar-design_23-2151869153.jpg?uid=R86975476&ga=GA1.1.1454705726.1706974768&semt=ais_hybrid",
        "https://img.freepik.com/free-psd/3d-rendering-hair-style-avatar-design_23-2151869153.jpg?uid=R86975476&ga=GA1.1.1454705726.1706974768&semt=ais_hybrid",
        "https://img.freepik.com/free-vector/young-prince-vector-illustration_1308-174367.jpg"
      ],
      "attachments": 2,
      "comments": 1
    },
    {
      "title": "Urgent Bug Fix",
      "status": "Urgent",
      "deadline": "10th August 2023",
      "progress": 75,
      "assignees": [
        "https://img.freepik.com/free-vector/young-prince-vector-illustration_1308-174367.jpg"
      ],
      "attachments": 1,
      "comments": 5
    },
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          WorkSpaceCubit(Userrepo(api: DioConsumer(dio: Dio())))
            ..getGroupById(widget.id),
      child: BlocConsumer<WorkSpaceCubit, WorkSpaceState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = BlocProvider.of<WorkSpaceCubit>(context);
          return Scaffold(
            appBar: HeaderTitle(
              title: "Work Spaces",
              onMorePressed: () {},
            ),
            body: SingleChildScrollView(
              child: state is WorkSpaceLoading
                  ? Center(
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
                                            return dialogWidget(
                                              deleteClick: () {
                                                cubit.deleteGroup(widget.id);
                                                if (state
                                                    is DeleteWorkSpaceSuccess) {
                                                  context
                                                      .navigateTo(Workspaces());
                                                  showTopSnackBar(
                                                    Overlay.of(context),
                                                    const CustomSnackBar.info(
                                                      message:
                                                          'Work space  delete  successfuly',
                                                    ),
                                                  );
                                                }
                                              },
                                              updateClick: () {},
                                            );
                                          },
                                        );
                                      },
                                      shareclick: () {},
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
                              Documentation(),
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
                                      onPressed: () {},
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

                              /// **Task List Based on Selected Filter**
                              TaskList(
                                  selectedFilter: selectedFilter, tasks: tasks),
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
