import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:project_graduation/Core/Theming/size/size.dart';

class ORWithWidget extends StatelessWidget {
  const ORWithWidget({super.key, required this.ontap1, required this.ontap2, required this.ontap3});
final VoidCallback ontap1;
final VoidCallback ontap2;
final VoidCallback ontap3;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         const Text(
                      "___________________ Or With ___________________",
                      style:
                          TextStyle(color: Color.fromARGB(255, 124, 131, 144)),
                    ),
                    size.height(15.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: ontap1,
                          child: const Icon(
                            Bootstrap.github,
                            size: 30,
                          ),
                        ),
                        size.width(15.w),
                        GestureDetector(
                          onTap: ontap2,
                          child: Image.asset(
                            "assets/images/google.png",
                            width: 30,
                            height: 30,
                          ),
                        ),
                        size.width(15.w),
                        GestureDetector(
                          onTap: ontap3,
                          child: Image.asset(
                            "assets/images/facebook_icon.png",
                            width: 30,
                            height: 30,
                          ),
                        )
                      ],
                    ),
      ],
    );
  }
}