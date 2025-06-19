import 'package:gradution_project/Core/Imports/common_imports.dart';

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
              const CopyLinkButton(
                text: "esraa",
              ),
              size.height(50),
              Confirmbutton(
                  text: "Get Started  ➔",
                  onTap: () {
                    context.navigateTo(const Workspaces());
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
