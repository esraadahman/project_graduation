import 'package:gradution_project/Core/Imports/common_imports.dart';

class IconsWidgets extends StatelessWidget {
  const IconsWidgets({
    super.key,
    required this.iconName,
    required this.namePage,
    required this.onclick,
  });
  final String iconName;
  final String namePage;
  final VoidCallback? onclick;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onclick,
      child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20.w),
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          height: height(context) / 10,
          decoration: BoxDecoration(
            color: ColorsClass.colorwhite,
            borderRadius: BorderRadius.circular(15.r),
            boxShadow: [
              BoxShadow(
                color: ColorsClass.primary.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(5, 0),
              ),
              BoxShadow(
                color: ColorsClass.primary.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(-5, 0),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    iconName,
                    width: 30,
                    height: 30,
                  ),
                  SizedBox(width: 20.w),
                  Text(
                    namePage,
                    style: styling.subtitle.copyWith(
                      fontSize: width(context) / 20,
                      fontWeight: FontWeight.normal,
                      color: ColorsClass.text,
                    ),
                  ),
                ],
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: ColorsClass.text,
                size: 26.w,
              ),
            ],
          )),
    );
  }
}
