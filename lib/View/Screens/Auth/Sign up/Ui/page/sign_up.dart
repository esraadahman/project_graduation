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
import 'package:project_graduation/View/Screens/Auth/School_account/Ui/pages/school_account.dart';
import 'package:project_graduation/View/Screens/Auth/School_account/Ui/widgets/TextButtonWidgetLoginOrSignUp.dart';
import 'package:project_graduation/View/Screens/Auth/School_account/Ui/widgets/alradyHaveAccountOrNot.dart';
import 'package:project_graduation/View/Screens/Auth/School_account/Ui/widgets/custominputFiled.dart';
import 'package:project_graduation/View/Screens/Auth/School_account/Ui/widgets/headingTextWidgets.dart';
import 'package:project_graduation/View/Screens/Auth/School_account/Ui/widgets/starOurjuarnyfromhere.dart';
import 'package:project_graduation/View/Screens/Auth/School_account/Ui/widgets/textAfterPassWidget.dart';
import 'package:project_graduation/View/Screens/Auth/School_or_company/Ui/page/school_or_company.dart';
import 'package:project_graduation/View/Screens/Auth/Sign%20in/Ui/Widgets/orwithWidget.dart';
import 'package:project_graduation/View/Screens/Auth/Sign%20in/Ui/page/sign_in.dart';
import 'package:project_graduation/View/Screens/Auth/Sign%20up/cubit/cubit/sign_up_cubit.dart';
import 'package:project_graduation/repo/AuthRepo.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(AuthRepo(api: DioConsumer(dio: Dio()))),
      child: BlocConsumer<SignUpCubit, SignUpState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          final cubit = BlocProvider.of<SignUpCubit>(context);
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
                          const StartOurJourneyFromHere(
                            text: "Start your journey from here",
                          ),
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
                          CustomInputField(
                            labelText: "Full Name",
                            hintText: "Enter your first and last name",
                            controller: cubit.fullNameController,
                          ),
                          size.height(20.h),
                          CustomInputField(
                            labelText: "Email",
                            hintText: "Enter your email",
                            controller: cubit.emailController,
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
                          size.height(20.h),
                          Confirmbutton(
                              text: "Sign up",
                              onTap: () {
                                cubit.signUp();
                              }),
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
        },
      ),
    );
  }
}
