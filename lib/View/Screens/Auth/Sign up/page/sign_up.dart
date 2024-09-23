import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_graduation/Core/Routing/routing.dart';
import 'package:project_graduation/Core/Theming/colors/colors.dart';
import 'package:project_graduation/Core/Theming/size/size.dart';
import 'package:project_graduation/View/Screens/Auth/Login_success/widgets/backgroundWidget.dart';
import 'package:project_graduation/View/Screens/Auth/OTP%20Verification/Widgets/confirmbutton.dart';
import 'package:project_graduation/View/Screens/Auth/School_account/pages/school_account.dart';
import 'package:project_graduation/View/Screens/Auth/School_account/widgets/TextButtonWidgetLoginOrSignUp.dart';
import 'package:project_graduation/View/Screens/Auth/School_account/widgets/alradyHaveAccountOrNot.dart';
import 'package:project_graduation/View/Screens/Auth/School_account/widgets/custominputFiled.dart';
import 'package:project_graduation/View/Screens/Auth/School_account/widgets/headingTextWidgets.dart';
import 'package:project_graduation/View/Screens/Auth/School_account/widgets/starOurjuarnyfromhere.dart';
import 'package:project_graduation/View/Screens/Auth/School_account/widgets/textAfterPassWidget.dart';
import 'package:project_graduation/View/Screens/Auth/School_or_company/page/school_or_company.dart';
import 'package:project_graduation/View/Screens/Auth/Sign%20in/Widgets/orwithWidget.dart';
import 'package:project_graduation/View/Screens/Auth/Sign%20in/page/sign_in.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          bacground_widget(),
          Align(
            alignment: Alignment.center,
            child: Container(
              width: 320.w,
              height: 510.h,
              decoration: BoxDecoration(
                color: ColorsClass.background,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    size.height(10.h),
                    const HeadingTextWidget(text: "New account"),
                    size.height(5.h),
                    const StartOurJourneyFromHere(),
                    size.height(10.h),
                    Row(
                      children: [
                        size.width(10.w),
                        const AlreadyHaveAnAccountOrNot(
                            content: "Already have an account?"),
                        TextButtonWidgetLoginOrSignUp(
                            onTap: () {
                              context.navigateTo(const SignInScreen());
                            },
                            text: "Login")
                      ],
                    ),
                    size.height(20.h),
                    const CustomInputField(
                      labelText: "Full Name",
                      hintText: "Enter your first and last name",
                    ),
                    size.height(20.h),
                    const CustomInputField(
                      labelText: "Email",
                      hintText: "Enter your email",
                    ),
                    size.height(20.h),
                    const CustomInputField(
                      labelText: "Password",
                      hintText: "Enter your password",
                      suffixIcon: true,
                      obscureText: true,
                    ),
                    const TextAfterPassWidget(),
                    size.height(20.h),
                    Confirmbutton(text: "Sign up", onTap: () {}),
                    size.height(5.h),
                    Align(
                        alignment: Alignment.bottomLeft,
                        child: TextButtonWidgetLoginOrSignUp(
                            onTap: () {
                              context.navigateTo(SchoolOrCompany());
                            },
                            text: "Register asCompany Or School")),
                    size.height(15.h),
                    const ORWithWidget(),
                    size.height(30.h)
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
// 