import 'package:project_graduation/Core/Imports/common_imports.dart';

class TextAfterPassWidget extends StatelessWidget {
  const TextAfterPassWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(left: 17.0),
      child: Text(
       LangClass.translate(context, 'password_guideline'),
        style: const TextStyle(
            color: ColorsClass.password_text, fontWeight: FontWeight.bold),
      ),
    );
  }
}