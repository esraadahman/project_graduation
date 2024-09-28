import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_graduation/Core/Routing/routing.dart';
import 'package:project_graduation/Core/Theming/colors/colors.dart';
import 'package:project_graduation/Core/Theming/size/size.dart';
import 'package:project_graduation/Core/api/dio_consumer.dart';
import 'package:project_graduation/View/Screens/Auth/Login_success/Ui/Page/login-succes.dart';
import 'package:project_graduation/View/Screens/Auth/Login_success/Ui/widgets/backgroundWidget.dart';
import 'package:project_graduation/View/Screens/Auth/OTP%20Verification/Ui/Page/otp_verification.dart';
import 'package:project_graduation/View/Screens/Auth/OTP%20Verification/Ui/Widgets/confirmbutton.dart';
import 'package:project_graduation/View/Screens/Auth/School_account/Ui/widgets/TextButtonWidgetLoginOrSignUp.dart';
import 'package:project_graduation/View/Screens/Auth/School_account/Ui/widgets/alradyHaveAccountOrNot.dart';
import 'package:project_graduation/View/Screens/Auth/School_account/Ui/widgets/checkButton.dart';
import 'package:project_graduation/View/Screens/Auth/School_account/Ui/widgets/custominputFiled.dart';
import 'package:project_graduation/View/Screens/Auth/School_account/Ui/widgets/headingTextWidgets.dart';
import 'package:project_graduation/View/Screens/Auth/Sign%20in/Ui/Widgets/orwithWidget.dart';
import 'package:project_graduation/View/Screens/Auth/Sign%20in/cubit/cubit/sign_in_cubit.dart';
import 'package:project_graduation/View/Screens/Auth/Sign%20up/Ui/page/sign_up.dart';
import 'package:project_graduation/repo/AuthRepo.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInCubit(AuthRepo(api: DioConsumer(dio: Dio()))),
      child: BlocConsumer<SignInCubit, SignInState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          final cubit = BlocProvider.of<SignInCubit>(context);
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
                            controller: cubit.passwordController,
                          ),
                          size.height(20.h),
                          Confirmbutton(
                              text: "Log in",
                              onTap: () {
                                cubit.signin();
                                //  context.navigateTo(LoginSuccess());
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
        },
      ),
    );
  }
}
