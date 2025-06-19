import 'package:gradution_project/Core/Imports/common_imports.dart';

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
          style: styling.maintitle.copyWith(fontSize: 18.sp),
        ),
        Text(
         date,
          style:
              styling.subtitle.copyWith(color: ColorsClass.date, fontSize: width(context)/30),
        ),
      ],
    );
  }
}
