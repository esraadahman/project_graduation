import 'package:gradution_project/Core/Imports/common_imports.dart';

class DividerWithText extends StatelessWidget {
  final String text;

  const DividerWithText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: Colors.grey[400], // Line color
            thickness: 1, // Line thickness
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(text,
              style: styling.subtitle.copyWith(
                fontSize: width(context) * .04,
                color: Colors.grey[600],
                fontWeight: FontWeight.normal,
              )),
        ),
        Expanded(
          child: Divider(
            color: Colors.grey[400],
            thickness: 1,
          ),
        ),
      ],
    );
  }
}
