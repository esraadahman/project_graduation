import 'package:project_graduation/Core/Imports/common_imports.dart';

class StartOurJourneyFromHere extends StatelessWidget {
  const StartOurJourneyFromHere({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        size.width(10),
        Text(
          text,
          style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: ColorsClass.sub_text),
        ),
      ],
    );
  }
}
