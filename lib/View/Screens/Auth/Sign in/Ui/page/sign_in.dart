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
                    width: width(context) / 1.2,
                    height: height(context) / 1.55,
                    decoration: BoxDecoration(
                      color: ColorsClass.background,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          size.height(height(context) / 100),
                          HeadingTextWidget(
                            text: LangClass.translate(context, "login"),
                          ),
                          size.height(height(context) / 1.55 / 200),
                          Row(
                            children: [
                              size.width(width(context) / 1.2 / 20),
                              AlreadyHaveAnAccountOrNot(
                                content:
                                    LangClass.translate(context, 'no_account'),
                              ),
                              TextButtonWidgetLoginOrSignUp(
                                onTap: () {
                                  context.navigateTo(SignUpScreen());
                                },
                                text: LangClass.translate(
                                    context, 'create_account'),
                              )
                            ],
                          ),
                          size.height(height(context) / 1.4 / 20),
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
                          size.height(height(context) / 1000),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    left: width(context) * 0.02),
                                child: TextButtonWidgetLoginOrSignUp(
                                    isbold: false,
                                    onTap: () {
                                      context.navigateTo(
                                          ForgetPassThatSendEmail());
                                    },
                                    text: LangClass.translate(
                                        context, "forgot_password")),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    right: width(context) * 0.02),
                                child: GradientCheckBoxWidget(
                                    text: LangClass.translate(
                                        context, "remember_me")),
                              )
                            ],
                          ),
                          size.height(height(context) / 40),
                          Confirmbutton(
                              text:
                                  LangClass.translate(context, "log_in_button"),
                              onTap: () {
                                   cubit.signin();
                                context.navigateTo(NaviBar());
                              }),
                          size.height(5.h),
                          size.height(15.h),
                          SizedBox(
                            width: width(context) / 1.3,
                            child: ORWithWidget(
                              text: "Or With",
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
