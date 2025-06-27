import 'package:gradution_project/Core/Imports/common_imports.dart';

class TextAfterPassWidget extends StatelessWidget {
  const TextAfterPassWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        size.width(width(context) / 1.2 / 20),
        Text(LangClass.translate(context, 'password_guideline'),
            style: styling.subtitle.copyWith(
                color: ColorsClass.password_text,
                fontWeight: FontWeight.bold,
                fontSize: width(context) / 36)),
      ],
    );
  }
}
