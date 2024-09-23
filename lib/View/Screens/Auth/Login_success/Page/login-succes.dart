import 'package:flutter/material.dart';
import 'package:project_graduation/View/Screens/Auth/Login_success/widgets/backgroundWidget.dart';
import 'package:project_graduation/View/Screens/Auth/Login_success/widgets/imageWidget.dart';
import 'package:project_graduation/View/Screens/Auth/Login_success/widgets/main_tilte.dart';
import 'package:project_graduation/View/Screens/Auth/Login_success/widgets/subtextWidget.dart';
import 'package:project_graduation/View/Screens/Auth/OTP%20Verification/Widgets/text_textbutton.dart';
import 'package:project_graduation/core/Theming/decoration/decoration.dart';
import 'package:project_graduation/core/Theming/size/size.dart';

class LoginSuccess extends StatelessWidget {
  const LoginSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          const bacground_widget(),
          Center(
            child: Container(
              height: size.heightMedia(context, .5),
              width: size.widthMedia(context, .85),
              decoration: CustomDecoration.decorationForCenterContainer(),
              child: Column(
                children: [
                  size.height(30),
                  MainTiltleWidget(
                    text: "Successfully",
                    fontSize: 22,
                  ),
                  size.height(7),
                  subtextWidget(
                    fontsize: 12,
                    text: "Go check your email to register the new password",
                  ),
                  size.height(45),
                  imageWidget(
                    image_src: 'assets/images/Frame 1000005506.png',
                  ),
                  size.height(20),
                  text_textbutton(
                    text: 'Did not get the message?',
                    buttontext: "Resend",
                    ontap: (){},
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
