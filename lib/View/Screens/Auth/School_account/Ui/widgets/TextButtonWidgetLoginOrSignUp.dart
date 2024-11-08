import 'package:project_graduation/Core/Imports/common_imports.dart';

class TextButtonWidgetLoginOrSignUp extends StatelessWidget {
  const TextButtonWidgetLoginOrSignUp(
      {super.key, required this.onTap, required this.text});
  final VoidCallback onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onTap,
        child: Text(
          text,
          style: const TextStyle(
              decoration: TextDecoration.underline,
              color: ColorsClass.primary,
              fontSize: 15,
              fontWeight: FontWeight.bold),
        ));
  }
}
