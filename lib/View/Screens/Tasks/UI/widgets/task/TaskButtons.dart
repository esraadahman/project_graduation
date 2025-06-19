import 'package:gradution_project/Core/Imports/common_imports.dart';

class TaskButtons extends StatelessWidget {
  const TaskButtons({
    super.key,
    required this.active,
    required this.name,
    required this.icon1,
    required this.icon2,
    required this.onclick,
  });

  final bool active;
  final String icon1;
  final String icon2;
  final String name;
  final VoidCallback? onclick;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onclick,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        padding: EdgeInsets.all(10),
        width: width(context) / 2.8,
        decoration: BoxDecoration(
          gradient: active ? ColorsClass.appGradient : ColorsClass.appGradient2,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              height: 25.0,

              active ? icon1 : icon2,
              // ? "assets/images/progress-clock.svg"
              // : "assets/images/progress-clock(unactive).svg",
            ),
            size.width(width(context) / 50),
            Text(
              name.isNotEmpty
                  ? name[0].toUpperCase() + name.substring(1)
                  : name,
              style: styling.maintitle.copyWith(
                  fontSize: 14.sp,
                  color: active ? ColorsClass.colorwhite : ColorsClass.date),
            )
          ],
        ),
      ),
    );
  }
}
