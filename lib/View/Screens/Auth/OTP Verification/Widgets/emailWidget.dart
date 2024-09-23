import 'package:flutter/material.dart';
import 'package:project_graduation/core/Theming/fonts/fonts.dart';
import 'package:project_graduation/core/Theming/size/size.dart';

class emailWidget extends StatelessWidget {
  const emailWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        size.width(15),
        Text(
          "email@example.email",
          style: styling.maintitle
              .copyWith(fontWeight: FontWeight.bold, fontSize: 15),
        ),
      ],
    );
  }
}
