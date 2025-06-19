import 'package:gradution_project/Core/Imports/common_imports.dart';

class WorkSpaceButton2Widget extends StatelessWidget {
  const WorkSpaceButton2Widget(
      {super.key,
      required this.image,
      required this.innerText,
      required this.border,
      required this.newWorkSpace,
      this.onclick});

  final String innerText;
  final String image;
  final bool border;
  final bool newWorkSpace;
  final VoidCallback? onclick;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onclick,
      child: Container(
        width: newWorkSpace ? 153.w : 66.w,
        height: 40.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(
                color: border ? ColorsClass.primary : ColorsClass.lightGrey)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 5,
              ),
              child: SvgPicture.asset(
                height: 20.0,
                image,
              ),
            ),
            size.width(3),
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
              child: Text(innerText,
                  style: styling.maintitle.copyWith(
                      fontSize: newWorkSpace ? 14.sp : 12.sp,
                      color: ColorsClass.colorwhite)),
            )
          ],
        ),
      ),
    );
  }
}
