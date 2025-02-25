import 'package:project_graduation/Core/Imports/common_imports.dart';

class HeadingTextWidget extends StatelessWidget {
  const HeadingTextWidget({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        size.width(width(context) / 1.2 / 20),
        Text(
          text,
          style: styling.maintitle.copyWith(
              fontSize: width(context) / 20, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
