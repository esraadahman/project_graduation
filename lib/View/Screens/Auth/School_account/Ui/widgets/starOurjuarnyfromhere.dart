import 'package:gradution_project/Core/Imports/common_imports.dart';

class StartOurJourneyFromHere extends StatelessWidget {
  const StartOurJourneyFromHere({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        size.width(width(context) / 1.2 / 20),
        Text(text,
            style: styling.subtitle.copyWith(
                fontSize: width(context) / 28,
                fontWeight: FontWeight.normal,
                color: ColorsClass.sub_text)),
      ],
    );
  }
}
