import 'package:project_graduation/Core/Imports/common_imports.dart';

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
                  imageWidget2(
                      image_src: "assets/images/Encapsulated Group.png"),
                  size.height(25),
                  MainTiltleWidget(
                      text: LangClass.translate(
                          context, "passwordChangedSuccess"),
                      fontSize: 14),
                  size.height(15),
                  subtextWidget(
                      text: LangClass.translate(
                          context, "passwordChangedSuccess"),
                      fontsize: 12),
                  size.height(50),
                  Confirmbutton(
                      text: LangClass.translate(context, "backToLogin"),
                      onTap: () {
                        context.navigateTo(SignInScreen());
                      })
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
