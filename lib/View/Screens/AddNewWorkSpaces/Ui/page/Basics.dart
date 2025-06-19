import 'package:gradution_project/Core/Imports/common_imports.dart';


class BasicsScreen extends StatelessWidget {
  const BasicsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorsClass.colorwhite,
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
            ],
          ),
        ));
  }
}
