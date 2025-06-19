import 'package:gradution_project/Core/Imports/common_imports.dart';

class TaskName extends StatelessWidget {
  const TaskName({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(height: 25.0, "assets/images/taskicon.svg"),
        size.width(10),
        Text(
          title,
          style: styling.subtitle.copyWith(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: ColorsClass.text,
          ),
        ),
      ],
    );
  }
}