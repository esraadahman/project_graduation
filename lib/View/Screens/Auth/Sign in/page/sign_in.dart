import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_graduation/Core/Routing/routing.dart';
import 'package:project_graduation/Core/Theming/colors/colors.dart';
import 'package:project_graduation/Core/Theming/size/size.dart';
import 'package:project_graduation/View/Screens/Auth/Login_success/Page/login-succes.dart';
import 'package:project_graduation/View/Screens/Auth/Login_success/widgets/backgroundWidget.dart';
import 'package:project_graduation/View/Screens/Auth/OTP%20Verification/Page/otp_verification.dart';
import 'package:project_graduation/View/Screens/Auth/OTP%20Verification/Widgets/confirmbutton.dart';
import 'package:project_graduation/View/Screens/Auth/School_account/widgets/TextButtonWidgetLoginOrSignUp.dart';
import 'package:project_graduation/View/Screens/Auth/School_account/widgets/alradyHaveAccountOrNot.dart';
import 'package:project_graduation/View/Screens/Auth/School_account/widgets/checkButton.dart';
import 'package:project_graduation/View/Screens/Auth/School_account/widgets/custominputFiled.dart';
import 'package:project_graduation/View/Screens/Auth/School_account/widgets/headingTextWidgets.dart';
import 'package:project_graduation/View/Screens/Auth/Sign%20in/Widgets/orwithWidget.dart';
import 'package:project_graduation/View/Screens/Auth/Sign%20up/page/sign_up.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
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
                    const HeadingTextWidget(text: "Log in"),
                    size.height(5.h),
                    size.height(10.h),
                    Row(
                      children: [
                        size.width(10.w),
                        const AlreadyHaveAnAccountOrNot(
                            content: "Don't have an account?"),
                        TextButtonWidgetLoginOrSignUp(
                            onTap: () {
                              context.navigateTo(const SignUpScreen());
                            },
                            text: "Create a new account")
                      ],
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
                    size.height(20.h),
                    Confirmbutton(
                        text: "Log in",
                        onTap: () {
                          context.navigateTo(LoginSuccess());
                        }),
                    size.height(5.h),
                    Row(
                      children: [
                        Align(
                            alignment: Alignment.bottomLeft,
                            child: TextButtonWidgetLoginOrSignUp(
                                onTap: () {
                                  context.navigateTo(OTP_Verification());
                                },
                                text: "Forgot your password?")),
                        const GradientCheckBoxWidget(text: "Remember me")
                      ],
                    ),
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
