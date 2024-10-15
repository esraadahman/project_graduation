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
          borderRadius: BorderRadius.circular(10),
            color: ColorsClass.background,
            border: Border.all(
                color: checked ? ColorsClass.primary : ColorsClass.background , width: 2)),
        child: Column(
          children: [
            SizedBox(height: 35), // Use SizedBox for spacing
            Icon(
              icon,
              size: 60,
              color: checked? ColorsClass.primary:ColorsClass.sub_text,
            ),
            Text(text),
          ],
        ),
      ),

      checked
          ? const Positioned(
              right: 0,
              bottom: 1,
              child:CircleAvatar(
                radius: 10,
                backgroundColor: ColorsClass.primary,
                child: Icon(Icons.check ,color: Colors.white,size: 13,),
              )
            )
          : Container(),
    ]);
  }
}