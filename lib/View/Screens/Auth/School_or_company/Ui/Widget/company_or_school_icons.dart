import 'package:project_graduation/Core/Imports/common_imports.dart';

class Company_or_school_icons extends StatelessWidget {
  Company_or_school_icons(
      {super.key,
      required this.checked,
      required this.icon,
      required this.text});
  bool checked;
  IconData icon;
  String text;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      // Main Container
      Container(
        width: width(context) / 3,
        height: height(context) / 6.9,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: ColorsClass.background,
            border: Border.all(
                color: checked ? ColorsClass.primary : ColorsClass.background,
                width: 2)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //  size.height(height(context) / 6 / 6),
            Icon(
              icon,
              size: width(context) / 4 / 2,
              color: checked ? ColorsClass.primary : ColorsClass.sub_text,
            ),
            Text(
              text,
              style: styling.subtitle.copyWith(
                  fontSize: width(context) / 4 / 10,
                  color: checked
                      ? ColorsClass.complateColorText
                      : ColorsClass.sub_text),
            ),
          ],
        ),
      ),

      checked
          ? Positioned(
              right: 0,
              bottom: 0,
              child: CircleAvatar(
                radius: width(context) / 50,
                backgroundColor: ColorsClass.primary,
                child: Icon(
                  Icons.check,
                  color: Colors.white,
                  size: width(context) * .03,
                ),
              ))
          : Container(),
    ]);
  }
}
