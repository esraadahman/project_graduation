import 'package:flutter/cupertino.dart';
import 'package:project_graduation/Core/Imports/common_imports.dart';

class NoteficationIconWidget extends StatelessWidget {
  const NoteficationIconWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 23),
      child: Container(
        width: 48.w,
        height: 48.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: ColorsClass.colorwhite),
        child: Center(
          child: Icon(
            CupertinoIcons.bell,
            color: ColorsClass.primary,
            size: 25.r,
          ),
        ),
      ),
    );
  }
}
