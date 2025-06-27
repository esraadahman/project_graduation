import 'package:gradution_project/Core/Imports/common_imports.dart';


class TemplatesScreen extends StatelessWidget {
  const TemplatesScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
            height: height(context) * .12,
            child: const ProgressBarWidget(
              activeIndex: 2,
            ),
          ),
          Textwidgets(
            onTap1: () {},
          ),
          size.height(26),
          Column(
              children: List.generate(
            images_workSpaces.length,
            (index) => Column(
              children: [
                Workspacetemplate(
                  image: images_workSpaces[index],
                  title: 'Title',
                  imagelist: listimages_member,
                ),
                const SizedBox(height: 20),
              ],
            ),
          )),
          Confirmbutton(
              text: "Finish",
              onTap: () {
              //  context.navigateTo(const SubmitconfirmScreen());
              }),
          size.height(20),
          Confirmbuttonprimary(
              text: "Back",
              onTap: () {
                //  context.navigateTo(StageScreen()
                //   );
              }),
          size.height(40),
        ])));
  }
}
