import 'package:flutter/material.dart';
import 'package:project_graduation/View/Screens/Auth/Login_success/widgets/backgroundWidget.dart';
import 'package:project_graduation/View/Screens/Auth/Login_success/widgets/main_tilte.dart';
import 'package:project_graduation/View/Screens/Auth/Login_success/widgets/subtextWidget.dart';
import 'package:project_graduation/View/Screens/Auth/OTP%20Verification/Widgets/confirmbutton.dart';
import 'package:project_graduation/View/Screens/Auth/OTP%20Verification/Widgets/imageWidget2.dart';
import 'package:project_graduation/core/Theming/decoration/decoration.dart';
import 'package:project_graduation/core/Theming/size/size.dart';

class ChangePassCorrect extends StatelessWidget {
  const ChangePassCorrect({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          const bacground_widget(),
          Center(
            child: Container(
              height: size.heightMedia(context, .5),
              width: size.widthMedia(context, .9),
              decoration: CustomDecoration.decorationForCenterContainer(),
              child: Column(
                children: [
                  size.height(20),
                  imageWidget2(image_src: "assets/images/Encapsulated Group.png"),
                  size.height(25),
                  MainTiltleWidget(
                      text: "  Your password has been changed successfully",
                      fontSize: 14),
                  size.height(15),
                  subtextWidget(
                      text:
                          "         Your password has been changed successfully",
                      fontsize: 12),
                  size.height(50),
                  Confirmbutton(text: "Back to log in", onTap: () {})
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
