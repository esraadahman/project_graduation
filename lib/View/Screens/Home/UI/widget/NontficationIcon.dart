import 'package:flutter/cupertino.dart';
import 'package:gradution_project/Core/Imports/common_imports.dart';

class NoteficationIconWidget extends StatelessWidget {
  const NoteficationIconWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width(context) * .12,
      height: width(context) * .12,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: ColorsClass.colorwhite),
      child: Center(
        child: Icon(
          CupertinoIcons.bell,
          color: ColorsClass.primary,
          size: width(context) * .06,
        ),
      ),
    );
  }
}
