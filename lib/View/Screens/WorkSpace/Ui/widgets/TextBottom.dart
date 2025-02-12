import 'package:project_graduation/Core/Imports/common_imports.dart';

class TextBottom extends StatelessWidget {
  String maintext;
  String subtext;
  TextBottom({super.key, required this.maintext, required this.subtext});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(maintext,
            style: styling.subtitle.copyWith(
                fontSize: 11,
                color: ColorsClass.sub_text,
                fontWeight: FontWeight.normal)),
        Text(subtext,
            style: styling.subtitle.copyWith(
                fontSize: 11,
                color: ColorsClass.text,
                fontWeight: FontWeight.normal)),
      ],
    );
  }
}
