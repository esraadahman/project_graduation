import 'package:gradution_project/View/Screens/Auth/forget_pass_that_send_email/cubit/cubit/forget_pass_email_cubit.dart';
import 'package:gradution_project/Core/Imports/common_imports.dart';

class ForgetPassThatSendEmail extends StatefulWidget {
  const ForgetPassThatSendEmail({super.key});

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
                const bacground_widget(),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: width(context) / 1.2,
                    height: height(context) / 2.3,
                    decoration: BoxDecoration(
                      color: ColorsClass.background,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          size.height(height(context) / 100),
                          HeadingTextWidget(
                              text: LangClass.translate(
                                  context, "forgot_password_main_text")),
                          size.height(height(context) / 150),
                          StartOurJourneyFromHere(
                              text:
                                  LangClass.translate(context, "instruction")),
                          size.height(height(context) / 100),
                          Row(
                            children: [
                              size.width(width(context) / 1.2 / 20),
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
                          size.height(height(context) * .025),
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
                          size.height(height(context) * .01),
                          Row(
                            children: [
                              size.width(width(context) / 1.2 / 20),
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
