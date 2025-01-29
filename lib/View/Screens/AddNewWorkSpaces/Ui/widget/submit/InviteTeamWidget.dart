import 'package:flutter/material.dart';
import 'package:project_graduation/Core/Imports/common_imports.dart';
import 'package:project_graduation/View/Screens/AddNewWorkSpaces/Ui/widget/submit/orWithWidget.dart';

class InviteTeamWidget extends StatelessWidget {
  final String labelText;
  final String? hintText;
  final TextEditingController? controller;
  final VoidCallback onTap;
  const InviteTeamWidget(
      {super.key,
      required this.labelText,
      required this.hintText,
      required this.onTap,
      this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width(context) * 0.9,
        margin: EdgeInsets.only(
            left: width(context) * .05, right: width(context) * .05),
        child: Column(children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(labelText,
                style: styling.subtitle
                    .copyWith(color: ColorsClass.password_text, fontSize: 14)),
          ),
          size.height(5),
          Row(
            children: [
              SizedBox(
                width: width(context) * .7,
                height: height(context) * .07,
                child: TextFormField(
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(
                              color: ColorsClass.border_color, width: 1)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(
                              color: ColorsClass.border_color, width: 1)),
                      hintText: hintText,
                      hintStyle: styling.subtitle.copyWith(
                          fontWeight: FontWeight.normal, fontSize: 14)),
                  controller: controller,
                ),
              ),
              size.width(width(context) * .03),
              SizedBox(
                height: height(context) * .07,
                child: ElevatedButton(
                  onPressed: onTap,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorsClass.primary,
                    padding: EdgeInsets.only(
                      left: width(context) * .005,
                      right: width(context) * 0.005,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    "Invite",
                    style: styling.subtitle.copyWith(
                      fontSize: width(context) / 30,
                      color: ColorsClass.colorwhite,
                    ),
                  ),
                ),
              ),
            ],
          ),
          size.height(40),
          DividerWithText(text: "Or With"),
          size.height(15.h),
        ]));
  }
}
