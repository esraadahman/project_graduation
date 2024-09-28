import 'package:flutter/material.dart';
import 'package:project_graduation/View/Screens/Auth/Login_success/UI/widgets/backgroundWidget.dart';
import 'package:project_graduation/View/Screens/Auth/Login_success/UI/widgets/main_tilte.dart';
import 'package:project_graduation/View/Screens/Auth/Login_success/UI/widgets/subtextWidget.dart';
import 'package:project_graduation/View/Screens/Auth/OTP%20Verification/UI/Widgets/confirmbutton.dart';
import 'package:project_graduation/View/Screens/Auth/OTP%20Verification/UI/Widgets/imageWidget2.dart';
import 'package:project_graduation/core/Theming/decoration/decoration.dart';
import 'package:project_graduation/core/Theming/size/size.dart';

class CreateAccountSuccefully extends StatelessWidget {
  const CreateAccountSuccefully({super.key});

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
                      text: "    Your account has been created successfully",
                      fontSize: 14),
                  size.height(15),
                  subtextWidget(
                      text:
                          "       start your journey now, What you are waiting for!",
                      fontsize: 12),
                  size.height(50),
                  Confirmbutton(text: "Take me home", onTap: () {})
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
