import 'package:project_graduation/View/Screens/Auth/forget_pass_that_send_email/cubit/cubit/forget_pass_email_cubit.dart';
import 'package:project_graduation/Core/Imports/common_imports.dart';

class ForgetPassThatSendEmail extends StatefulWidget {
  ForgetPassThatSendEmail({super.key});

  @override
  State<ForgetPassThatSendEmail> createState() =>
      _ForgetPassThatSendEmailState();
}

class _ForgetPassThatSendEmailState extends State<ForgetPassThatSendEmail> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ForgetPassEmailCubit(AuthRepo(api: DioConsumer(dio: Dio()))),
      child: BlocConsumer<ForgetPassEmailCubit, ForgetPassEmailState>(
        listener: (context, state) {
          // Handle success state and navigate
          if (state is ForgetPassEmailSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                    LangClass.translate(context, "email_sent_successfully")),
              ),
            );

            // Ensure you're navigating to the correct screen
            context.navigateTo(OTP_Verification());
          }

          // Handle failure state, if any
          if (state is ForgetPassEmailFail) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(LangClass.translate(context, "failed")),
              ),
            );
          }
        },
        builder: (context, state) {
          final cubit = BlocProvider.of<ForgetPassEmailCubit>(context);
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
                          HeadingTextWidget(
                              text: LangClass.translate(
                                  context, "forgot_password_main_text")),
                          size.height(15.h),
                          StartOurJourneyFromHere(
                              text:
                                  LangClass.translate(context, "instruction")),
                          size.height(10.h),
                          Row(
                            children: [
                              size.width(10.w),
                              AlreadyHaveAnAccountOrNot(
                                  content: LangClass.translate(
                                      context, "remember_password")),
                              TextButtonWidgetLoginOrSignUp(
                                  onTap: () {
                                    context.navigateTo(SignUpScreen());
                                  },
                                  text: LangClass.translate(context, "login"))
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
                          Confirmbutton(
                            text: LangClass.translate(context, 'next'),
                            onTap: () {
                              cubit.forgetPassword();
                            },
                          ),
                          size.height(5.h),
                          Row(
                            children: [
                              size.width(10.w),
                              AlreadyHaveAnAccountOrNot(
                                content: LangClass.translate(
                                    context, 'facing_problems'),
                              ),
                              TextButtonWidgetLoginOrSignUp(
                                  onTap: () {
                                    context.navigateTo(SignUpScreen());
                                  },
                                  text: LangClass.translate(
                                      context, 'contact_support'))
                            ],
                          ),
                          size.height(15.h),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
