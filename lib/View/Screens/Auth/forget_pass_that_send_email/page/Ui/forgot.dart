import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_graduation/Core/Routing/routing.dart';
import 'package:project_graduation/Core/Theming/colors/colors.dart';
import 'package:project_graduation/Core/Theming/size/size.dart';
import 'package:project_graduation/View/Screens/Auth/Login_success/Ui/Page/login-succes.dart';
import 'package:project_graduation/View/Screens/Auth/Login_success/Ui/widgets/backgroundWidget.dart';
import 'package:project_graduation/View/Screens/Auth/OTP%20Verification/Ui/Widgets/confirmbutton.dart';
import 'package:project_graduation/View/Screens/Auth/School_account/Ui/widgets/TextButtonWidgetLoginOrSignUp.dart';
import 'package:project_graduation/View/Screens/Auth/School_account/Ui/widgets/alradyHaveAccountOrNot.dart';
import 'package:project_graduation/View/Screens/Auth/School_account/Ui/widgets/custominputFiled.dart';
import 'package:project_graduation/View/Screens/Auth/School_account/Ui/widgets/headingTextWidgets.dart';
import 'package:project_graduation/View/Screens/Auth/School_account/Ui/widgets/starOurjuarnyfromhere.dart';
import 'package:project_graduation/View/Screens/Auth/Sign%20up/Ui/page/sign_up.dart';

class ForgetPassThatSendEmail extends StatefulWidget {
  const ForgetPassThatSendEmail({super.key});

  @override
  State<ForgetPassThatSendEmail> createState() => _ForgetPassThatSendEmailState();
}

class _ForgetPassThatSendEmailState extends State<ForgetPassThatSendEmail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          bacground_widget(),
          Align(
            alignment: Alignment.center,
            child: Container(
              width: 330.w,
              height: 400.h,
              decoration: BoxDecoration(
                color: ColorsClass.background,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    size.height(10.h),
                    const HeadingTextWidget(text: "You forgot your password"),
                    size.height(15.h),
                    const StartOurJourneyFromHere(text: 'To get you back to your account write\n your email to send you the link'),
                    size.height(10.h),
                    Row(
                      children: [
                        size.width(10.w),
                        const AlreadyHaveAnAccountOrNot(
                            content: "Did you remember your password?"),
                        TextButtonWidgetLoginOrSignUp(
                            onTap: () {
                              context.navigateTo(const SignUpScreen());
                            },
                            text: "LogIn")
                      ],
                    ),
                    size.height(20.h),
                    const CustomInputField(
                      labelText: "Email",
                      hintText: "Enter your email",
                    ),
                    
                    size.height(20.h),
                    Confirmbutton(
                        text: "Next",
                        onTap: () {
                          context.navigateTo(LoginSuccess());
                        }),
                    size.height(5.h),
                    Row(
                      children: [
                        size.width(10.w),
                        const AlreadyHaveAnAccountOrNot(
                            content: "Are you facing any problems?"),
                        TextButtonWidgetLoginOrSignUp(
                            onTap: () {
                              context.navigateTo(const SignUpScreen());
                            },
                            text: "Contact support")
                      ],
                    ),
                  
                    size.height(15.h),
                  
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
