import 'package:flutter/cupertino.dart';
import 'package:project_graduation/Core/Imports/common_imports.dart';

class SchoolOrCompany extends StatefulWidget {
  SchoolOrCompany({super.key});

  @override
  State<SchoolOrCompany> createState() => _SchoolOrCompanyState();
}

class _SchoolOrCompanyState extends State<SchoolOrCompany> {
  bool checked_company = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          const bacground_widget(),
          Center(
            child: Container(
              width: width(context) / 1.2,
              height: height(context) / 1.9,
              decoration: CustomDecoration.decorationForCenterContainer(),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    size.height(height(context) / 100),
                    MainTiltleWidget(
                      text: LangClass.translate(context, "new_account"),
                      fontSize: width(context) / 20,
                    ),
                    size.height(height(context) / 1.9 / 200),
                    Row(
                      children: [
                        size.width(width(context) / 1.2 / 20),
                        subtextWidget(
                            text: LangClass.translate(context, "start_journey"),
                            fontsize: width(context) / 40),
                      ],
                    ),
                    size.height(height(context) * .009),
                    Row(
                      children: [
                        size.width(width(context) / 1.2 / 20),
                        AlreadyHaveAnAccountOrNot(
                            content: LangClass.translate(
                                context, "already_have_account")),
                        TextButtonWidgetLoginOrSignUp(
                            onTap: () {
                              context.navigateTo(SignInScreen());
                            },
                            text: LangClass.translate(context, "login"))
                      ],
                    ),
                    size.height(height(context) * .01),
                    MainTiltleWidget(
                      text: LangClass.translate(context, "account_type"),
                      fontSize: width(context) / 35,
                    ),
                    size.height(height(context) * .02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                            onTap: () {
                              setState(() {
                                checked_company = true;
                              });
                            },
                            child: Company_or_school_icons(
                              checked: checked_company,
                              icon: Icons.school,
                              text: LangClass.translate(context, "school"),
                            )),
                        GestureDetector(
                            onTap: () {
                              setState(() {
                                checked_company = false;
                              });
                            },
                            child: Company_or_school_icons(
                              checked: !checked_company,
                              icon: CupertinoIcons.building_2_fill,
                              text: LangClass.translate(context, "company"),
                            )),
                      ],
                    ),
                    size.height(height(context) * .04),
                    Confirmbutton(
                        text: LangClass.translate(context, "next"),
                        onTap: () {
                          checked_company
                              ? context.navigateTo(SchoolAccountScreen())
                              //

                              : null;
                        }),
                    size.height(10),
                    Row(
                      children: [
                        size.width(width(context) * .013),
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              LangClass.translate(context, "register_as_user"),
                              style: styling.subtitle.copyWith(
                                  color: ColorsClass.primary,
                                  decoration: TextDecoration.underline,
                                  decorationColor: ColorsClass.primary,
                                  fontWeight: FontWeight.normal,
                                  fontSize: width(context) * .03),
                            )),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
