import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_graduation/Core/Routing/routing.dart';
import 'package:project_graduation/Core/api/dio_consumer.dart';
import 'package:project_graduation/View/Screens/Auth/Login_success/Ui/widgets/backgroundWidget.dart';
import 'package:project_graduation/View/Screens/Auth/Login_success/Ui/widgets/main_tilte.dart';
import 'package:project_graduation/View/Screens/Auth/Login_success/Ui/widgets/subtextWidget.dart';
import 'package:project_graduation/View/Screens/Auth/OTP%20Verification/Ui/Widgets/confirmbutton.dart';
import 'package:project_graduation/View/Screens/Auth/OTP%20Verification/Ui/Widgets/emailWidget.dart';
import 'package:project_graduation/View/Screens/Auth/OTP%20Verification/Ui/Widgets/imageWidget2.dart';
import 'package:project_graduation/View/Screens/Auth/OTP%20Verification/Ui/Widgets/text_textbutton.dart';
import 'package:project_graduation/View/Screens/Auth/OTP%20Verification/Ui/Widgets/textfiledWidget.dart';
import 'package:project_graduation/View/Screens/Auth/OTP%20Verification/cubit/cubit/otp_code_cubit.dart';
import 'package:project_graduation/View/Screens/Auth/create_new_pass/Ui/page/new_pass.dart';
import 'package:project_graduation/core/Theming/decoration/decoration.dart';
import 'package:project_graduation/core/Theming/size/size.dart';
import 'package:project_graduation/repo/AuthRepo.dart';

class OTP_Verification extends StatefulWidget {
  const OTP_Verification({super.key});

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
                  title: const Text("Alert!"),
                  content: Text("Check your email again"),
                  actions: [
                    // TextButton(
                    //   onPressed: () {
                    //     Navigator.of(context).pop(); // Close the dialog
                    //     // Navigate to the login screen
                    //   },
                    //   child: const Text("Login instead"),
                    // ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(); // Close the dialog
                      },
                      child: Text("OK"),
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
                            text: "OTP Verification",
                            fontSize: 20,
                          ),
                          size.height(20),
                          subtextWidget(
                              fontsize: 14,
                              text:
                                  "We will send you a one-time\npassword for this email"),
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
                                const Text(
                                  'Wrong OTP code entered please try again',
                                  style: TextStyle(
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
                            text: 'Did not receive the message?',
                            buttontext: "Resend",
                          ),
                          size.height(30),
                          Confirmbutton(
                            onTap: () {
                              // String enteredCode = listControllers
                              //     .map((controller) => controller.text)
                              //     .join();

                              cubit.CheckOtpCode();
                            },
                            text: 'Confirm',
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
