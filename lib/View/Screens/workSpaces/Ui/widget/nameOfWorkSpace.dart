import 'package:project_graduation/Core/Imports/common_imports.dart';

class nameWorkSpace extends StatelessWidget {
  String title;
  String date;
  nameWorkSpace({super.key, required this.title, required this.date});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: styling.maintitle.copyWith(fontSize: 20),
        ),
        Text(
         date,
          style:
              styling.subtitle.copyWith(color: ColorsClass.date, fontSize: 13),
        ),
      ],
    );
  }
}
