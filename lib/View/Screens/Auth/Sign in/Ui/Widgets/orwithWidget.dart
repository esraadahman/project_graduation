import 'package:gradution_project/Core/Imports/common_imports.dart';

class ORWithWidget extends StatelessWidget {
  const ORWithWidget(
      {super.key,
      required this.text,
      required this.ontap1,
      required this.ontap2,
      required this.ontap3});
  final VoidCallback ontap1;
  final VoidCallback ontap2;
  final VoidCallback ontap3;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DividerWithText(text: text),
        size.height(15.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: ontap1,
              child: Icon(
                Bootstrap.github,
                size:width(context) <= 800?width(context)/13: width(context) / 18,
              ),
            ),
            size.width(15.w),
            GestureDetector(
                onTap: ontap2,
                child: Image.asset(
                  "assets/images/google.png",
                  width:width(context) <= 800? width(context) / 14:width(context) / 20,
                  height: height(context) / 17,
                )),
            size.width(15.w),
            GestureDetector(
              onTap: ontap3,
              child: Image.asset(
                "assets/images/facebook2.png",
                width:width(context) <= 800?width(context) / 13 :width(context) / 17,
                height: height(context) / 17,
              ),
            )
          ],
        ),
      ],
    );
  }
}
