import 'package:flutter/material.dart';
import 'package:project_graduation/Core/Routing/routing.dart';
import 'package:project_graduation/View/Screens/Auth/Login_success/widgets/backgroundWidget.dart';
import 'package:project_graduation/View/Screens/Auth/Login_success/widgets/imageWidget.dart';
import 'package:project_graduation/View/Screens/Auth/Login_success/widgets/main_tilte.dart';
import 'package:project_graduation/View/Screens/Auth/Login_success/widgets/subtextWidget.dart';
import 'package:project_graduation/View/Screens/Auth/OTP%20Verification/Widgets/confirmbutton.dart';
import 'package:project_graduation/View/Screens/Auth/OTP%20Verification/Widgets/text_textbutton.dart';
import 'package:project_graduation/View/Screens/Auth/School_account/pages/school_account.dart';
import 'package:project_graduation/core/Theming/colors/colors.dart';
import 'package:project_graduation/core/Theming/decoration/decoration.dart';
import 'package:project_graduation/core/Theming/fonts/fonts.dart';
import 'package:project_graduation/core/Theming/size/size.dart';

class SchoolOrCompany extends StatelessWidget {
  const SchoolOrCompany({super.key});

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
                            context.navigateTo(const SchoolAccountScreen());
                          },
                          child: Image.asset(
                              "assets/images/Frame 1000005630.png")),
                      Image.asset("assets/images/Frame 1000005627.png")
                    ],
                  ),
                  size.height(50),
                  Confirmbutton(text: "Next", onTap: () {}),
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
