import 'package:project_graduation/Core/Imports/common_imports.dart';

class AlreadyHaveAnAccountOrNot extends StatelessWidget {
  const AlreadyHaveAnAccountOrNot({super.key, required this.content});
  final String content;
  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      style: const TextStyle(
          fontSize: 15, fontWeight: FontWeight.bold, color: ColorsClass.text),
    );
  }
}
