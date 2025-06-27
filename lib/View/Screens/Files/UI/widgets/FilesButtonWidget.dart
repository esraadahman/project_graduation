import 'package:gradution_project/Core/Imports/common_imports.dart';

class FilesButtonWidget extends StatelessWidget {
  const FilesButtonWidget(
      {super.key,
      required this.image,
      required this.innerText,
      required this.border,
      required this.allWorkSpaces,
      this.onclick});

  final String innerText;
  final String image;
  final bool border;
  final bool allWorkSpaces;
  final VoidCallback? onclick;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onclick,
      child: Container(
        // width: allWorkSpaces? 153.w:167.w ,
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        height: 50.h,
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
              child: allWorkSpaces
                  ? SvgPicture.asset(
                      height: 24.0,
                      width: 24,
                      image,
                    )
                  : CircleAvatar(
                      radius: 18,
                      backgroundColor: const Color.fromARGB(255, 197, 197, 198),
                    ),
            ),
            size.width(10),
            allWorkSpaces
                ? ShaderMask(
                    shaderCallback: (bounds) => const LinearGradient(
                      colors: [
                        ColorsClass.dark_gradient,
                        ColorsClass.light_gradient,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ).createShader(bounds),
                    child: Text(
                      innerText,
                      style: styling.maintitle.copyWith(
                        fontSize: 14.sp,
                        color:
                            Colors.white, // White makes shader visible properly
                      ),
                    ),
                  )
                : Text(
                    innerText,
                    style: styling.maintitle.copyWith(
                      fontSize: 14.sp,
                      color: ColorsClass.password_text, // or any color you want
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
