import 'package:flutter/material.dart';
import 'package:project_graduation/core/Theming/fonts/fonts.dart';
import 'package:project_graduation/core/Theming/size/size.dart';

class MainTiltleWidget extends StatelessWidget {
  MainTiltleWidget({super.key, required this.text, required this.fontSize});
  String text;
  double fontSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        size.width(15),
        Text(
          text,
          style: styling.maintitle.copyWith(
            fontSize: fontSize,
          ),
        ),
      ],
    );
  }
}
