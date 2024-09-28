import 'package:flutter/material.dart';
import 'package:project_graduation/Core/Theming/colors/colors.dart';

class Company_or_school_icons extends StatelessWidget {
  Company_or_school_icons(
      {super.key,
      required this.checked,
      required this.icon,
      required this.text});
  bool checked;
  IconData icon;
  String text;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      // Main Container
      Container(
        width: 150,
        height: 150,
        decoration: BoxDecoration(
            color: ColorsClass.background,
            border: Border.all(
                color: checked ? ColorsClass.primary : ColorsClass.background)),
        child: Column(
          children: [
            SizedBox(height: 35), // Use SizedBox for spacing
            Icon(
              icon,
              size: 60,
              color: ColorsClass.sub_text,
            ),
            Text(text),
          ],
        ),
      ),

      checked
          ? Positioned(
              right: 1,
              bottom: 2,
              child: Image.asset(
                'assets/images/Tick_Color.png',
                height: 20,
                width: 20,
              ),
            )
          : Container(),
    ]);
  }
}
