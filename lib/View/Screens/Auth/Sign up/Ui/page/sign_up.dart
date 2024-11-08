import 'package:project_graduation/Core/Imports/common_imports.dart';
import 'package:project_graduation/View/Screens/Auth/Sign%20up/cubit/cubit/sign_up_cubit.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(AuthRepo(api: DioConsumer(dio: Dio()))),
      child: BlocConsumer<SignUpCubit, SignUpState>(
        listener: (context, state) {
          if (state is SignUpSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
              ),
            );
            context.navigateTo(SignInScreen());
          } else if (state is SignUpFailure) {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("Alert!"),
                  content: Text(state.errMessage ?? "An error occurred."),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(); // Close the dialog
                        context.navigateTo(
                            SignInScreen()); // Navigate to the login screen
                      },
                      child: Text("Login instead"),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(); // Close the dialog
                      },
                      child: Text("Cancel"),
                    ),
                  ],
                );
              },
            );
          }
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
                          HeadingTextWidget(
                              text:
                                  LangClass.translate(context, "new_account")),
                          size.height(5.h),
                          StartOurJourneyFromHere(
                            text: LangClass.translate(context, "start_journey"),
                          ),
                          size.height(10.h),
                          Row(
                            children: [
                              size.width(10.w),
                              AlreadyHaveAnAccountOrNot(
                                  content: LangClass.translate(context, "already_have_account")),
                              TextButtonWidgetLoginOrSignUp(
                                  onTap: () {
                                    context.navigateTo(SignInScreen());
                                  },
                                  text: LangClass.translate(context, "login"))
                            ],
                          ),
                          size.height(20.h),
                          CustomInputField(
                            labelText:LangClass.translate(context, "full_name"),
                            hintText: LangClass.translate(context, "enter_full_name"),
                            controller: cubit.fullNameController,
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
                            controller: cubit.passController,
                          ),
                          TextAfterPassWidget(),
                          size.height(20.h),
                          Confirmbutton(
                              text:   LangClass.translate(context, 'signup'),
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
                                  text:  LangClass.translate(context, 'register_as'),)),
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
