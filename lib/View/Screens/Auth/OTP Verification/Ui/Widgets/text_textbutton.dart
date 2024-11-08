import 'package:project_graduation/Core/Imports/common_imports.dart';

class text_textbutton extends StatelessWidget {
  text_textbutton(
      {super.key,
      required this.text,
      required this.buttontext,
      required this.ontap});
  String text;
  String buttontext;
  final VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        size.width(15),
        Text(
          text,
          style: styling.subtitle.copyWith(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: ColorsClass.text),
        ),
        TextButton(
            onPressed: ontap,
            child: Text(
              buttontext,
              style: styling.subtitle.copyWith(
                  color: ColorsClass.primary,
                  decoration: TextDecoration.underline,
                  decorationColor: ColorsClass.primary,
                  fontSize: 15),
            ))
      ],
    );
  }
}
