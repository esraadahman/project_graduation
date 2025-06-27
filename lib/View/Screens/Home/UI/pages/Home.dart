import 'package:gradution_project/Core/Imports/common_imports.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        UserInfo(),
        size.height(32),
        const SearshBarWidget(),
        Expanded(
          child: ListView(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            children: [
              const Card1Widget(),
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
              const CardNextTasks()
            ],
          ),
        ),
      ],
    );
  }
}
