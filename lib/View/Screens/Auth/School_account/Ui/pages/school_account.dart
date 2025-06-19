import 'package:gradution_project/Core/Imports/common_imports.dart';
import 'package:gradution_project/View/Screens/Auth/School_account/cubit/cubit/school_account_cubit.dart';

class SchoolAccountScreen extends StatelessWidget {
  SchoolAccountScreen({super.key});

  final bool _isChecked = false;

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
                    width: width(context) / 1.2,
                    height: height(context) / 1.3,
                    decoration: BoxDecoration(
                      color: ColorsClass.background,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          size.height(10),
                          HeadingTextWidget(
                            text:
                                LangClass.translate(context, "school_account"),
                          ),
                          size.height(5),
                          StartOurJourneyFromHere(
                            text: LangClass.translate(context, 'start_journey'),
                          ),
                          size.height(10.h),
                          Row(
                            children: [
                              size.width(width(context) * .04),
                              AlreadyHaveAnAccountOrNot(
                                content: LangClass.translate(
                                    context, 'already_have_account'),
                              ),
                              TextButtonWidgetLoginOrSignUp(
                                  onTap: () {
                                    context.navigateTo(const SignInScreen());
                                  },
                                  text: "Login")
                            ],
                          ),
                          size.height(height(context) * .01),
                          CustomInputField(
                            labelText:
                                LangClass.translate(context, "full_name"),
                            hintText:
                                LangClass.translate(context, "enter_full_name"),
                            controller: cubit.fullNameController,
                          ),
                          size.height(height(context) * .03),
                          CustomInputField(
                            labelText: LangClass.translate(context, 'email'),
                            hintText:
                                LangClass.translate(context, 'enter_email'),
                            controller: cubit.emailController,
                          ),
                          size.height(height(context) * .03),
                          PhoneNumberField(
                            controller: cubit.phoneController,
                          ),
                          GradientCheckBoxWidget(
                            text:
                                LangClass.translate(context, 'sameAsWhatsapp'),
                          ),
                          size.height(height(context) * .03),
                          CustomInputField(
                            labelText: LangClass.translate(context, 'password'),
                            hintText:
                                LangClass.translate(context, 'enter_password'),
                            suffixIcon: true,
                            obscureText: true,
                            controller: cubit.passController,
                          ),
                          size.height(height(context) / 100),
                          const TextAfterPassWidget(),
                          size.height(height(context) * .03),
                          Confirmbutton(
                              text: LangClass.translate(context, 'signup'),
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
