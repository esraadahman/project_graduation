import 'package:project_graduation/Core/Imports/common_imports.dart';

class WorkSpaceButtonWidget extends StatelessWidget {
  const WorkSpaceButtonWidget(
      {super.key,
      required this.icon,
      required this.innerText,
      required this.grad,
      required this.border,
      required this.progress,
      required this.active});

  final String innerText;
  final Icon icon;
  final bool grad;
  final bool border;
  final bool progress;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: progress ? 150.w : 100.w,
      height: 45.h,
      decoration: BoxDecoration(
          gradient: grad ? ColorsClass.appGradient : null,
          borderRadius: BorderRadius.circular(10.r),
          border: border ? Border.all(color: ColorsClass.lightGrey) : null),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          size.width(5),
          Text(
            innerText,
            style: styling.maintitle.copyWith(
                fontSize: 16.sp,
                color: active ? ColorsClass.colorwhite : ColorsClass.date),
          )
        ],
      ),
    );
  }
}
