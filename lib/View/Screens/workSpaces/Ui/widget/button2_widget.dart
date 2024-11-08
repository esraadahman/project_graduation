import 'package:project_graduation/Core/Imports/common_imports.dart';

class WorkSpaceButton2Widget extends StatelessWidget {
  const WorkSpaceButton2Widget(
      {super.key,
      required this.icon,
      required this.innerText,
      required this.border,
      required this.newWorkSpace});

  final String innerText;
  final Icon icon;
  final bool border;
  final bool newWorkSpace;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: newWorkSpace ? 160.w : 85.w,
      height: 20.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(
              color: border ? ColorsClass.primary : ColorsClass.lightGrey)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          size.width(5),

          ShaderMask(
            // ignore: prefer_const_constructors
            shaderCallback: (bounds) => LinearGradient(
              colors: const [
                ColorsClass.dark_gradient,
                ColorsClass.light_gradient
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ).createShader(bounds),
            child: Text(
              innerText,
              style: TextStyle(
                color: Colors.white, // This color will be ignored by ShaderMask
                fontSize: 15.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
          // Text(innerText,
          // style: styling.maintitle.copyWith(fontSize: 16.sp,),)
        ],
      ),
    );
  }
}
