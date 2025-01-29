import 'package:project_graduation/Core/Imports/common_imports.dart';

class Textwidget extends StatelessWidget {
  const Textwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        imageWidget2(image_src: "assets/images/Encapsulated Group.png"),
        SizedBox(height: height(context) * 0.04),
        Text(
          "Your workspace has been created\nsuccessfully",
          textAlign: TextAlign.center,
          style: styling.maintitle.copyWith(
            fontSize: width(context) * .055,
            fontFamily: "Lexend",
          ),
        ),
        SizedBox(height: height(context) * 0.04),
        Text(
          " Thank you for your effort and time. Thanks\nfor choosing us and our services",
          textAlign: TextAlign.center,
          style: styling.subtitle.copyWith(
            fontSize: width(context) * .04,
            color: ColorsClass.password_text,
            fontWeight: FontWeight.normal,
            fontFamily: "Lexend",
          ),
        ),
      ],
    );
  }
}
