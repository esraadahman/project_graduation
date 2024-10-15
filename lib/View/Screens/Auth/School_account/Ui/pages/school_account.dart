import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_graduation/Core/Routing/routing.dart';
import 'package:project_graduation/Core/Theming/colors/colors.dart';
import 'package:project_graduation/Core/Theming/size/size.dart';
import 'package:project_graduation/Core/api/dio_consumer.dart';
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
import 'package:project_graduation/View/Screens/Auth/School_account/cubit/cubit/school_account_cubit.dart';
import 'package:project_graduation/View/Screens/Auth/Sign%20in/Ui/page/sign_in.dart';
import 'package:project_graduation/View/Screens/Auth/createAccountSuccessfully/Ui/page/create_account_succefully.dart';
import 'package:project_graduation/repo/AuthRepo.dart';

class SchoolAccountScreen extends StatelessWidget {
  SchoolAccountScreen({super.key});

  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          SchoolAccountCubit(AuthRepo(api: DioConsumer(dio: Dio()))),
      child: BlocConsumer<SchoolAccountCubit, SchoolAccountState>(
        listener: (context, state) {
          if (state is SchoolAccountSccess) {
            context.navigateTo(const CreateAccountSuccefully());
          }
        },
        builder: (context, state) {
          final cubit = BlocProvider.of<SchoolAccountCubit>(context);
          return Scaffold(
            body: Stack(
              children: [
                const bacground_widget(),
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
                          const StartOurJourneyFromHere(
                            text: "Start your journey from here",
                          ),
                          size.height(10.h),
                          Row(
                            children: [
                              size.width(10),
                              const AlreadyHaveAnAccountOrNot(
                                  content: "Already have an account?"),
                              TextButtonWidgetLoginOrSignUp(
                                  onTap: () {
                                    context.navigateTo(const SignInScreen());
                                  },
                                  text: "Login")
                            ],
                          ),
                          size.height(20),
                          CustomInputField(
                            labelText: "Full Name",
                            hintText: "Enter your first and last name",
                            controller: cubit.fullNameController,
                          ),
                          size.height(20),
                          CustomInputField(
                            labelText: "Email",
                            hintText: "Enter your email",
                            controller: cubit.emailController,
                          ),
                          size.height(20),
                          PhoneNumberField(
                            controller: cubit.phoneController,
                          ),
                          const GradientCheckBoxWidget(
                            text: "Same as whatsApp number",
                          ),
                          size.height(20.h),
                          CustomInputField(
                            labelText: "Password",
                            hintText: "Enter your password",
                            suffixIcon: true,
                            obscureText: true,
                            controller: cubit.passController,
                          ),
                          const TextAfterPassWidget(),
                          size.height(20),
                          Confirmbutton(
                              text: "Sign up",
                              onTap: () {
                                cubit.SignUpWith_SchoolAccount();
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
        },
      ),
    );
  }
}
