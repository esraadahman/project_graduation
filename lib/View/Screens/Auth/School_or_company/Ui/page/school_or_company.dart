import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:project_graduation/Core/Routing/routing.dart';
import 'package:project_graduation/View/Screens/Auth/Login_success/Ui/widgets/backgroundWidget.dart';
import 'package:project_graduation/View/Screens/Auth/Login_success/Ui/widgets/main_tilte.dart';
import 'package:project_graduation/View/Screens/Auth/Login_success/Ui/widgets/subtextWidget.dart';
import 'package:project_graduation/View/Screens/Auth/OTP%20Verification/Ui/Widgets/confirmbutton.dart';
import 'package:project_graduation/View/Screens/Auth/OTP%20Verification/Ui/Widgets/text_textbutton.dart';
import 'package:project_graduation/View/Screens/Auth/School_account/Ui/pages/school_account.dart';
import 'package:project_graduation/View/Screens/Auth/School_or_company/Ui/Widget/company_or_school_icons.dart';
import 'package:project_graduation/core/Theming/colors/colors.dart';
import 'package:project_graduation/core/Theming/decoration/decoration.dart';
import 'package:project_graduation/core/Theming/fonts/fonts.dart';
import 'package:project_graduation/core/Theming/size/size.dart';

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
              height: size.heightMedia(context, .62),
              width: size.widthMedia(context, .9),
              decoration: CustomDecoration.decorationForCenterContainer(),
              child: Column(
                children: [
                  size.height(25),
                  MainTiltleWidget(
                    text: "New account",
                    fontSize: 23,
                  ),
                  size.height(5),
                  subtextWidget(
                      text: "Start your journey from here", fontsize: 15),
                  size.height(10),
                  text_textbutton(
                    text: "Already have an account?",
                    buttontext: 'Log in',
                    ontap: () {},
                  ),
                  size.height(20),
                  MainTiltleWidget(text: "Account Type", fontSize: 15),
                  size.height(15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              checked_company = !checked_company;
                            });
                          },
                          child: Company_or_school_icons(
                            checked: !checked_company,
                            icon: Icons.school,
                            text: 'School',
                          )),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              checked_company = true;
                            });
                          },
                          child: Company_or_school_icons(
                            checked: checked_company,
                            icon: CupertinoIcons.building_2_fill,
                            text: 'Company',
                          )),
                    ],
                  ),
                  size.height(50),
                  Confirmbutton(
                      text: "Next",
                      onTap: () {
                        checked_company
                            ? context.navigateTo(const SchoolAccountScreen())
                            : context.navigateTo(const SchoolAccountScreen());
                      }),
                  size.height(10),
                  Row(
                    children: [
                      size.width(15),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            "Register as Regular User",
                            style: styling.subtitle.copyWith(
                                color: ColorsClass.primary,
                                decoration: TextDecoration.underline,
                                decorationColor: ColorsClass.primary,
                                fontSize: 12),
                          )),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

