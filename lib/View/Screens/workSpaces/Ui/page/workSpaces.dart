import 'package:flutter/cupertino.dart';
import 'package:project_graduation/Core/Imports/common_imports.dart';
import 'package:project_graduation/View/Screens/workSpaces/Ui/widget/HeaderTitle.dart';
import 'package:project_graduation/View/Screens/workSpaces/Ui/widget/WorkSpaceButton2_widget.dart';
import 'package:project_graduation/View/Screens/workSpaces/Ui/widget/WorkSpacebuttonWidget.dart';

class Workspaces extends StatelessWidget {
  const Workspaces({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              const WorkSpaceButton2Widget(
                  image: "assets/images/add.svg",
                  innerText: "New Work Space",
                  border: true,
                  newWorkSpace: true),
              size.width(8),
              const WorkSpaceButton2Widget(
                  image: "assets/images/Filter.svg",
                  innerText: "Filter",
                  border: false,
                  newWorkSpace: false),
              size.width(5),
              const WorkSpaceButton2Widget(
                  image: "assets/images/Swap.svg",
                  innerText: "Sort",
                  border: false,
                  newWorkSpace: false),
            ],
          ),
        ),
        size.height(26),
        Expanded(
          child: ListView.separated(
            shrinkWrap: true,
            //   physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  containerOFImageOFWorkSpace(
                    image: images_workSpaces[index],
                    title: 'Title',
                    date: "Last edit date",
                    numMembers: 5,
                    imagelist: listimages_member,
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
            itemCount: images_workSpaces.length,
          ),
        ),
      ]),
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
