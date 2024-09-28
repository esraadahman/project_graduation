import 'package:flutter/material.dart';
import 'package:project_graduation/View/Screens/Auth/Login_success/Ui/widgets/backgroundWidget.dart';
import 'package:project_graduation/View/Screens/Auth/Login_success/Ui/widgets/main_tilte.dart';
import 'package:project_graduation/View/Screens/Auth/Login_success/Ui/widgets/subtextWidget.dart';
import 'package:project_graduation/View/Screens/Auth/OTP%20Verification/Ui/Widgets/confirmbutton.dart';
import 'package:project_graduation/View/Screens/Auth/OTP%20Verification/Ui/Widgets/emailWidget.dart';
import 'package:project_graduation/View/Screens/Auth/OTP%20Verification/Ui/Widgets/imageWidget2.dart';
import 'package:project_graduation/View/Screens/Auth/OTP%20Verification/Ui/Widgets/text_textbutton.dart';
import 'package:project_graduation/View/Screens/Auth/OTP%20Verification/Ui/Widgets/textfiledWidget.dart';
import 'package:project_graduation/core/Theming/decoration/decoration.dart';
import 'package:project_graduation/core/Theming/size/size.dart';

class OTP_Verification extends StatefulWidget {
  const OTP_Verification({super.key});

  @override
  State<OTP_Verification> createState() => _OTP_VerificationState();
}

class _OTP_VerificationState extends State<OTP_Verification> {
  final String validCode_correct = '2222';
  bool vaildcode_user = true;
  final TextEditingController code1 = TextEditingController();
  final TextEditingController code2 = TextEditingController();
  final TextEditingController code3 = TextEditingController();
  final TextEditingController code4 = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    vaildcode_user = true;
  }

  @override
  Widget build(BuildContext context) {
    final List<TextEditingController> listControllers = [
      code1,
      code2,
      code3,
      code4,
    ];
    return Scaffold(
      body: Stack(
        children: <Widget>[
          const bacground_widget(),
          Center(
            child: Container(
              height: size.heightMedia(context, .7),
              width: size.widthMedia(context, .85),
              decoration: CustomDecoration.decorationForCenterContainer(),
              child: Column(
                children: [
                  size.height(20),
                  imageWidget2(
                      image_src: vaildcode_user
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
                        controller: listControllers[index],
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
                  !vaildcode_user
                      ? Row(
                          children: [
                            size.width(15),
                            const Text(
                              'Wrong password entered please try again',
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 11.5),
                            ),
                          ],
                        )
                      : Container(),
                  size.height(10),
                  text_textbutton(
                    ontap: () {},
                    text: 'Did not receive the message?',
                    buttontext: "Resend",
                  ),
                  size.height(30),
                  Confirmbutton(
                    onTap: () {
                      String enteredCode = listControllers
                          .map((controller) => controller.text)
                          .join();
                      if (enteredCode == validCode_correct) {
                        setState(() {
                          vaildcode_user = true;
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Code is valid!')));
                        });
                      } else {
                        setState(() {
                          vaildcode_user = false;
                        });
                      }
                    },
                    text: 'Confirm',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
