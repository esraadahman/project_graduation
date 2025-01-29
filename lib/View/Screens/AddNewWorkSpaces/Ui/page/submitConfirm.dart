import 'package:project_graduation/Core/Imports/common_imports.dart';
import 'package:project_graduation/View/Screens/AddNewWorkSpaces/Ui/widget/submit/InviteTeamWidget.dart';
import 'package:project_graduation/View/Screens/AddNewWorkSpaces/Ui/widget/submit/copyLink.dart';
import 'package:project_graduation/View/Screens/AddNewWorkSpaces/Ui/widget/submit/emailCallWidget.dart';
import 'package:project_graduation/View/Screens/AddNewWorkSpaces/Ui/widget/submit/textWidget.dart';

class SubmitconfirmScreen extends StatelessWidget {
  const SubmitconfirmScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsClass.colorwhite,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: height(context) * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Textwidget(),
              size.height(height(context) * .03),
              InviteTeamWidget(
                onTap: () {},
                labelText: 'Invite your team members',
                hintText: "Enter your team members' email",
              ),
              CopyLinkButton(
                onCopy: () {
                  print("Link copied!");
                },
              ),
              size.height(50),
              Confirmbutton(
                  text: "Get Started  ➔",
                  onTap: () {
                    context.navigateTo(SubmitconfirmScreen());
                  }),
              size.height(10),
              emailCallWidget(
                onTap: () {
                  print('Email clicked');
                },
              ),
            ],
          ),
        ),
      )),
    );
  }
}
