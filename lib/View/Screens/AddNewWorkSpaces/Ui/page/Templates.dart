import 'package:project_graduation/Core/Imports/common_imports.dart';
import 'package:project_graduation/View/Screens/AddNewWorkSpaces/Ui/widget/Templates/textWidgets.dart';
import 'package:project_graduation/View/Screens/AddNewWorkSpaces/Ui/widget/Templates/workspaceTemplate.dart';
import 'package:project_graduation/View/Screens/workSpaces/Ui/widget/WorkSpacebuttonWidget.dart';

class TemplatesScreen extends StatelessWidget {
  const TemplatesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorsClass.background,
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
          ))
        ])));
  }
}
