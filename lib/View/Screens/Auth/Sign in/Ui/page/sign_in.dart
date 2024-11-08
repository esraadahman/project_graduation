import 'package:project_graduation/Core/Imports/common_imports.dart';
import 'package:project_graduation/View/Screens/Auth/Sign%20in/cubit/cubit/sign_in_cubit.dart';
import 'package:project_graduation/View/Screens/Home/UI/pages/Navi.dart';



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
                          HeadingTextWidget(
                            text: LangClass.translate(context, "login"),
                          ),
                          size.height(5.h),
                          size.height(10.h),
                          Row(
                            children: [
                              size.width(10.w),
                              AlreadyHaveAnAccountOrNot(
                                content:
                                    LangClass.translate(context, 'no_account'),
                              ),
                              TextButtonWidgetLoginOrSignUp(
                                onTap: () {
                                  context.navigateTo( SignUpScreen());
                                },
                                text: LangClass.translate(
                                    context, 'create_account'),
                              )
                            ],
                          ),
                          size.height(20.h),
                          CustomInputField(
                            labelText: LangClass.translate(context, 'email'),
                            hintText:
                                LangClass.translate(context, 'enter_email'),
                            controller: cubit.emailController,
                          ),
                          size.height(20.h),
                          CustomInputField(
                            labelText: LangClass.translate(context, 'password'),
                            hintText:
                                LangClass.translate(context, 'enter_password'),
                            suffixIcon: true,
                            obscureText: true,
                            controller: cubit.passwordController,
                          ),
                          size.height(20.h),
                          Confirmbutton(
                              text:
                                  LangClass.translate(context, "log_in_button"),
                              onTap: () {
                           //    cubit.signin();
                                  context.navigateTo(NaviBar());
                              }),
                          size.height(5.h),
                          Row(
                            children: [
                              Align(
                                  alignment: Alignment.bottomLeft,
                                  child: TextButtonWidgetLoginOrSignUp(
                                      onTap: () {
                                        context.navigateTo(
                                            ForgetPassThatSendEmail());
                                      },
                                      text: LangClass.translate(
                                          context, "forgot_password"))),
                              GradientCheckBoxWidget(
                                  text: LangClass.translate(
                                      context, "remember_me"))
                            ],
                          ),
                          size.height(15.h),
                          ORWithWidget(
                            ontap1: () {
                              cubit.SignUpWithGitHub();
                            },
                            ontap2: () {
                              cubit.signUpWithGoogle();
                            },
                            ontap3: () {
                              cubit.SignUpWithFaceBook();
                            },
                          ),
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
