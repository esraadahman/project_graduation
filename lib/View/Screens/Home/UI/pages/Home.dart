import 'package:project_graduation/Core/Imports/common_imports.dart';
import 'package:flutter/cupertino.dart';
import 'package:project_graduation/View/Screens/Home/UI/widget/CardNextTasks.dart';
import 'package:project_graduation/View/Screens/Home/UI/widget/CircleAvatar&AppBarText.dart';
import 'package:project_graduation/View/Screens/Home/UI/widget/NontficationIcon.dart';
import 'package:project_graduation/View/Screens/Home/UI/widget/searsh_icon.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 140.h,
          width: MediaQuery.sizeOf(context).width,
          decoration: BoxDecoration(
              color: ColorsClass.primary,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30.r),
                  bottomRight: Radius.circular(30.r))),
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              children: [
                size.width(25),
                CircleAvatarAndAppBarText(userImage: "https://img.freepik.com/free-photo/portrait-young-woman-with-natural-make-up_23-2149084942.jpg?ga=GA1.1.1454705726.1706974768&semt=ais_hybrid",userName: "Mariam Mohie",),
                size.width(25),
               NoteficationIconWidget(),
              ],
            ),
          ),
        ),
        size.height(32),
       SearshBarWidget(),
        Expanded(
          child: ListView(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            children: [
              Card1Widget(),
              size.height(40),
              Row(
                children: [
                  size.width(25),
                  Text(
                    "Next Tasks",
                    style: styling.maintitle.copyWith(
                        fontSize: 18.sp, color: ColorsClass.homeCardText),
                  ),
                ],
              ),
             
              
              CardNextTasks()

            ],
          ),
        ),
      ],
    );
  }
}
