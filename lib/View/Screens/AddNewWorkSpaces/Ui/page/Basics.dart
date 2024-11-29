import 'package:project_graduation/Core/Imports/common_imports.dart';
import 'package:project_graduation/View/Screens/AddNewWorkSpaces/Ui/page/stage.dart';

class BasicsScreen extends StatelessWidget {
  const BasicsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorsClass.background,
        appBar: HeaderTitle(
          title: "Add New Work Space",
          onMorePressed: () {},
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              size.height(height(context) * .05),
              SizedBox(
                width: width(context),
                height: height(context) * .17,
                child: const ProgressBarWidget(
                  activeIndex: 0,
                ),
              ),
              const Nameinputfiled(
                labelText: "Name",
                hintText: "Enter your work space name",
                items: ['Option 1', 'Option 2', 'Option 3', 'Option 4'],
              ),
              size.height(40),
              const Objective_Button(),
              Confirmbutton(
                  text: "Next",
                  onTap: () {
                    context.navigateTo(StageScreen());
                  }),
              size.height(30),
            ],
          ),
        ));
  }
}
