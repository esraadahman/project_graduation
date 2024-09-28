import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_graduation/Core/Routing/routing.dart';
import 'package:project_graduation/Core/Theming/colors/colors.dart';
import 'package:project_graduation/Core/Theming/size/size.dart';
import 'package:project_graduation/View/Screens/Auth/Login_success/Ui/widgets/backgroundWidget.dart';
import 'package:project_graduation/View/Screens/Auth/OTP%20Verification/Ui/Widgets/confirmbutton.dart';
import 'package:project_graduation/View/Screens/Auth/School_account/Ui/widgets/custominputFiled.dart';
import 'package:project_graduation/View/Screens/Auth/School_account/Ui/widgets/headingTextWidgets.dart';
import 'package:project_graduation/View/Screens/Auth/School_account/Ui/widgets/starOurjuarnyfromhere.dart';
import 'package:project_graduation/View/Screens/Auth/School_account/Ui/widgets/textAfterPassWidget.dart';
import 'package:project_graduation/View/Screens/Auth/change_pass_correct/Ui/Page/change_pass_correct.dart';

class CreateNewPass extends StatefulWidget {
  const CreateNewPass({super.key});

  @override
  State<CreateNewPass> createState() => _CreateNewPassState();
}

class _CreateNewPassState extends State<CreateNewPass> {
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
              height: 400.h,
              decoration: BoxDecoration(
                color: ColorsClass.background,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    size.height(10.h),
                    const HeadingTextWidget(text: "Create new password"),
                    size.height(15.h),
                    const StartOurJourneyFromHere(text: 'Return to your journey'),
                    size.height(10.h),
                    
                    size.height(20.h),
                     const CustomInputField(
                      labelText: "New Password",
                      hintText: "Please enter your password",
                      suffixIcon: false,
                      obscureText: true,
                    ),
                    const TextAfterPassWidget(),
                    size.height(20.h),
                     const CustomInputField(
                      labelText: "Confirm Password",
                      hintText: "Please enter your password again",
                      suffixIcon: false,
                      obscureText: true,
                    ),
                    
                    size.height(20.h),
                    Confirmbutton(
                        text: "Reset Password",
                        onTap: () {
                          context.navigateTo(ChangePassCorrect());
                        }),
                    size.height(5.h),
                   
                  
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
