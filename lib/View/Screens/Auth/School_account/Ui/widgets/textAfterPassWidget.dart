import 'package:flutter/material.dart';
import 'package:project_graduation/Core/Theming/colors/colors.dart';

class TextAfterPassWidget extends StatelessWidget {
  const TextAfterPassWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 17.0),
      child: Text(
        "Use 8 characters or more with a mix letters , numbers and symbols",
        style: TextStyle(
            color: ColorsClass.password_text, fontWeight: FontWeight.bold),
      ),
    );
  }
}