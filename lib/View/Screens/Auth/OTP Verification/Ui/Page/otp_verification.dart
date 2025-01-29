import 'package:project_graduation/View/Screens/Auth/OTP%20Verification/cubit/cubit/otp_code_cubit.dart';
import 'package:project_graduation/Core/Imports/common_imports.dart';

class OTP_Verification extends StatefulWidget {
  OTP_Verification({super.key});

  @override
  State<OTP_Verification> createState() => _OTP_VerificationState();
}

class _OTP_VerificationState extends State<OTP_Verification> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OtpCodeCubit(AuthRepo(api: DioConsumer(dio: Dio()))),
      child: BlocConsumer<OtpCodeCubit, OtpCodeState>(
        listener: (context, state) {
          if (state is OtpCodeSuccess) {
            context.navigateTo(CreateNewPass());
          } else if (state is ResendEmailSuccess) {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text(LangClass.translate(context, "alert")),
                  content: Text(LangClass.translate(context, "checkEmail")),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(); // Close the dialog
                      },
                      child: Text(LangClass.translate(context, "ok")),
                    ),
                  ],
                );
              },
            );
          }
        },
        builder: (context, state) {
          final cubit = BlocProvider.of<OtpCodeCubit>(context);
          return Scaffold(
            body: Stack(
              children: <Widget>[
                const bacground_widget(),
                Center(
                  child: Container(
                    height: size.heightMedia(context, .75),
                    width: size.widthMedia(context, .85),
                    decoration: CustomDecoration.decorationForCenterContainer(),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          size.height(20),
                          imageWidget2(
                              image_src: !(state is OtpCodeFail)
                                  ? "assets/images/Clip path group.png"
                                  : "assets/images/Clip path group (1).png"),
                          size.height(25),
                          MainTiltleWidget(
                            text: LangClass.translate(
                                context, "otp_verification"),
                            fontSize: 20,
                          ),
                          size.height(20),
                          Row(
                            children: [
                              size.width(width(context) / 1.2 / 20),
                              subtextWidget(
                                fontsize: 14,
                                text:
                                    LangClass.translate(context, "otp_message"),
                              ),
                            ],
                          ),
                          size.height(10),
                          const emailWidget(),
                          size.height(30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: List.generate(4, (index) {
                              return TextFormWidget(
                                controller: cubit.listControllers[index],
                                label: '${index + 1}',
                                onChanged: (value) {
                                  if (value.length == 1 && index < 3) {
                                    FocusScope.of(context).nextFocus();
                                  } else if (value.isEmpty && index > 0) {
                                    FocusScope.of(context).previousFocus();
                                  }
                                },
                              );
                            }),
                          ),
                          size.height(20),
                          if (state is OtpCodeFail)
                            Row(
                              children: [
                                size.width(15),
                                Text(
                                  LangClass.translate(context, "wrongOtp"),
                                  style: const TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 11.5),
                                ),
                              ],
                            ),
                          size.height(10),
                          text_textbutton(
                            ontap: () {
                              cubit.resendEmail();
                            },
                            text:
                                LangClass.translate(context, "resend_message"),
                            buttontext: LangClass.translate(context, "resend"),
                          ),
                          size.height(30),
                          Confirmbutton(
                            onTap: () {
                              // String enteredCode = listControllers
                              //     .map((controller) => controller.text)
                              //     .join();

                              cubit.CheckOtpCode();
                            },
                            text: LangClass.translate(context, "confirm"),
                          ),
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
