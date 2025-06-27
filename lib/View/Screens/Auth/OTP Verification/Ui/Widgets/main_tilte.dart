import 'package:gradution_project/Core/Imports/common_imports.dart';

class MainTiltleWidget extends StatelessWidget {
  MainTiltleWidget({super.key, required this.text, required this.fontSize});
  String text;
  double fontSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        size.width(width(context) / 1.2 / 20),
        Text(
          text,
          style: styling.maintitle.copyWith(
            fontSize: fontSize,
          ),
        ),
      ],
    );
  }
}
