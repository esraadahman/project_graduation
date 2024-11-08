import 'package:project_graduation/Core/Imports/common_imports.dart';
import 'package:project_graduation/View/Screens/Auth/School_account/cubit/cubit/school_account_cubit.dart';

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
            context.navigateTo(CreateAccountSuccefully());
          }
        },
        builder: (context, state) {
          final cubit = BlocProvider.of<SchoolAccountCubit>(context);
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
                              size.width(10),
                              AlreadyHaveAnAccountOrNot(
                                content: LangClass.translate(
                                    context, 'already_have_account'),
                              ),
                              TextButtonWidgetLoginOrSignUp(
                                  onTap: () {
                                    context.navigateTo(SignInScreen());
                                  },
                                  text: "Login")
                            ],
                          ),
                          size.height(20),
                          CustomInputField(
                            labelText:
                                LangClass.translate(context, "full_name"),
                            hintText:
                                LangClass.translate(context, "enter_full_name"),
                            controller: cubit.fullNameController,
                          ),
                          size.height(20),
                          CustomInputField(
                            labelText: LangClass.translate(context, 'email'),
                            hintText:
                                LangClass.translate(context, 'enter_email'),
                            controller: cubit.emailController,
                          ),
                          size.height(20),
                          PhoneNumberField(
                            controller: cubit.phoneController,
                          ),
                          GradientCheckBoxWidget(
                            text:
                                LangClass.translate(context, 'sameAsWhatsapp'),
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
                          size.height(20),
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
