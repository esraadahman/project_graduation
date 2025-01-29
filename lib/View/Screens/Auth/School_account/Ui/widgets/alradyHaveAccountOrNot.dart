import 'package:project_graduation/Core/Imports/common_imports.dart';

class AlreadyHaveAnAccountOrNot extends StatelessWidget {
  const AlreadyHaveAnAccountOrNot({super.key, required this.content});
  final String content;
  @override
  Widget build(BuildContext context) {
    return Text(content,
        style: styling.maintitle.copyWith(
            fontSize: width(context) / 35,
            fontWeight: FontWeight.bold,
            color: ColorsClass.text));
  }
}
