import 'package:project_graduation/Core/Imports/common_imports.dart';

class WorkSpaceButtonWidget extends StatelessWidget {
  const WorkSpaceButtonWidget(
      {super.key,
      required this.image,
      required this.innerText,
      required this.grad,
      required this.border,
      required this.progress,
      required this.active});

  final String innerText;
  final String image;
  final bool grad;
  final bool border;
  final bool progress;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: progress ? 130.w : 89.w,
      height: 40.h,
      decoration: BoxDecoration(
          gradient: grad ? ColorsClass.appGradient : null,
          borderRadius: BorderRadius.circular(10.r),
          border: border ? Border.all(color: ColorsClass.lightGrey) : null),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 5,
            ),
            child: SvgPicture.asset(
              height: 20.0,
              color: active ? ColorsClass.colorwhite : ColorsClass.date,
              image,
            ),
          ),
          size.width(5),
          Text(
            innerText,
            style: styling.maintitle.copyWith(
                fontSize: 14.sp,
                color: active ? ColorsClass.colorwhite : ColorsClass.date),
          )
        ],
      ),
    );
  }
}
