import 'package:flutter/material.dart';
import 'package:project_graduation/core/Theming/size/size.dart';

class imageWidget extends StatelessWidget {
  imageWidget({super.key, required this.image_src});
  String image_src;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        size.width(25),
        Image.asset(image_src),
      ],
    );
  }
}
