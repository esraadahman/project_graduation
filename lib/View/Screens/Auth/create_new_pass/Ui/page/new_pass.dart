import 'package:gradution_project/View/Screens/Auth/create_new_pass/cubit/cubit/new_password_cubit.dart';
import 'package:gradution_project/Core/Imports/common_imports.dart';

class CreateNewPass extends StatefulWidget {
  const CreateNewPass({super.key});

  @override
  State<CreateNewPass> createState() => _CreateNewPassState();
}

class _CreateNewPassState extends State<CreateNewPass> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          NewPasswordCubit(AuthRepo(api: DioConsumer(dio: Dio()))),
      child: BlocConsumer<NewPasswordCubit, NewPasswordState>(
        listener: (context, state) {
          if (state is NewPasswordSuccess) {
            context.navigateTo(const ChangePassCorrect());
          }
        },
        builder: (context, state) {
          final cubit = BlocProvider.of<NewPasswordCubit>(context);
          return Scaffold(
            body: Stack(
              children: [
                const bacground_widget(),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: 320.w,
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
                                  context, "createNewPassword")),
                          size.height(15.h),
                          StartOurJourneyFromHere(
                              text: LangClass.translate(
                                  context, "returnToJourney")),
                          size.height(10.h),
                          size.height(20.h),
                          CustomInputField(
                            labelText:
                                LangClass.translate(context, "newPassword"),
                            hintText:
                                LangClass.translate(context, "enterPassword"),
                            suffixIcon: false,
                            obscureText: true,
                            controller: cubit.pass,
                            onChanged: (value) {
                              cubit.validatePasswords(); // Validate on change
                            },
                          ),
                          const TextAfterPassWidget(),
                          size.height(20.h),
                          CustomInputField(
                            labelText:
                                LangClass.translate(context, "confirmPassword"),
                            hintText: LangClass.translate(
                                context, "enterPasswordAgain"),
                            suffixIcon: false,
                            obscureText: true,
                            controller: cubit.confirmPass,
                            onChanged: (value) {
                              cubit.validatePasswords(); // Validate on change
                            },
                          ),
                          if (state is NewPasswordMisMatch)
                            Row(
                              children: [
                                size.width(15),
                                Text(
                                  state.message,
                                  style: const TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 11.5),
                                ),
                              ],
                            ),
                          size.height(20.h),
                          Confirmbutton(
                              text:
                                  LangClass.translate(context, "resetPassword"),
                              onTap: () {
                                cubit
                                    .validatePasswords(); // Validate on button press
                                if (state is! NewPasswordMisMatch) {
                                  cubit.CreatNewPass();
                                }
                              }),
                          size.height(5.h),
                          size.height(15.h),
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
