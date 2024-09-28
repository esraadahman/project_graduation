import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_graduation/Core/Routing/routing.dart';
import 'package:project_graduation/Core/Theming/colors/colors.dart';
import 'package:project_graduation/Core/Theming/size/size.dart';
import 'package:project_graduation/View/Screens/Auth/Login_success/Ui/widgets/backgroundWidget.dart';
import 'package:project_graduation/View/Screens/Auth/OTP%20Verification/Ui/Widgets/confirmbutton.dart';
import 'package:project_graduation/View/Screens/Auth/School_account/Ui/widgets/TextButtonWidgetLoginOrSignUp.dart';
import 'package:project_graduation/View/Screens/Auth/School_account/Ui/widgets/alradyHaveAccountOrNot.dart';
import 'package:project_graduation/View/Screens/Auth/School_account/Ui/widgets/checkButton.dart';
import 'package:project_graduation/View/Screens/Auth/School_account/Ui/widgets/custominputFiled.dart';
import 'package:project_graduation/View/Screens/Auth/School_account/Ui/widgets/headingTextWidgets.dart';
import 'package:project_graduation/View/Screens/Auth/School_account/Ui/widgets/phoneNumberFiled.dart';
import 'package:project_graduation/View/Screens/Auth/School_account/Ui/widgets/starOurjuarnyfromhere.dart';
import 'package:project_graduation/View/Screens/Auth/School_account/Ui/widgets/textAfterPassWidget.dart';
import 'package:project_graduation/View/Screens/Auth/Sign%20in/Ui/page/sign_in.dart';
import 'package:project_graduation/View/Screens/Auth/createAccountSuccessfully/Ui/page/create_account_succefully.dart';


class SchoolAccountScreen extends StatefulWidget {
  const SchoolAccountScreen({super.key});

  @override
  State<SchoolAccountScreen> createState() => _SchoolAccountScreenState();
}

class _SchoolAccountScreenState extends State<SchoolAccountScreen> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          bacground_widget(),
          Align(
            alignment: Alignment.center,
            child: Container(
              width: 320,
              height: 510,
              decoration: BoxDecoration(
                color: ColorsClass.background,
                borderRadius: BorderRadius.circular(10),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    size.height(10),
                    const HeadingTextWidget(text: "School account"),
                    size.height(5),
                    const StartOurJourneyFromHere(text:  "Start your journey from here",),
                    size.height(10.h),
                    Row(
                      children: [
                        size.width(10),
                        const AlreadyHaveAnAccountOrNot(
                            content: "Already have an account?"),
                        TextButtonWidgetLoginOrSignUp(
                            onTap: () {
                              context.navigateTo(SignInScreen());
                            },
                            text: "Login")
                      ],
                    ),
                    size.height(20),
                    const CustomInputField(
                      labelText: "Full Name",
                      hintText: "Enter your first and last name",
                    ),
                    size.height(20),
                    const CustomInputField(
                      labelText: "Email",
                      hintText: "Enter your email",
                    ),
                    size.height(20),
                    const PhoneNumberField(),
                    const GradientCheckBoxWidget(
                      text: "Same as whatsApp number",
                    ),
                    size.height(20.h),
                    const CustomInputField(
                      labelText: "Password",
                      hintText: "Enter your password",
                      suffixIcon: true,
                      obscureText: true,
                    ),
                    const TextAfterPassWidget(),
                    size.height(20),
                    Confirmbutton(
                        text: "Sign up",
                        onTap: () {
                          context.navigateTo(CreateAccountSuccefully());
                        }),
                    size.height(5),
                    size.height(15),
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
