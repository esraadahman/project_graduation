import 'package:flutter/material.dart';
import 'package:project_graduation/core/Theming/fonts/fonts.dart';
import 'package:project_graduation/core/Theming/size/size.dart';

class subtextWidget extends StatelessWidget {
  subtextWidget({super.key, required this.text, required this.fontsize});
  String text;
  double fontsize;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //   size.width(width(context) / 1.2 / 20),
        Text(
          text,
          style: styling.subtitle.copyWith(
            fontSize: fontsize, fontWeight: FontWeight.normal,
            // 12
          ),
        ),
      ],
    );
  }
}
