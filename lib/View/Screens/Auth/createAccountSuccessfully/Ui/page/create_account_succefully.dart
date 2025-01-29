import 'package:project_graduation/Core/Imports/common_imports.dart';

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
              height: height(context) / 2,
              width: width(context) / 1.2,
              decoration: CustomDecoration.decorationForCenterContainer(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  imageWidget2(
                      image_src: "assets/images/Encapsulated Group.png"),
                  size.height(height(context) / 20),
                  MainTiltleWidget(
                      text: LangClass.translate(context, "accountCreated"),
                      fontSize: width(context) / 30),
                  size.height(height(context) * .02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      subtextWidget(
                          text:
                              "Start your journey now, What are you waiting for!",
                          fontsize: width(context) / 40),
                    ],
                  ),
                  size.height(height(context) / 30),
                  Confirmbutton(
                      text: LangClass.translate(context, "takeMeHome"),
                      onTap: () {})
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
