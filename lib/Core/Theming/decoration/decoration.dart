import 'package:flutter/material.dart';
import 'package:gradution_project/Core/Theming/colors/colors.dart';

class CustomDecoration {
  static BoxDecoration decorationForCenterContainer() {
    return BoxDecoration(
      color: ColorsClass.background,
      borderRadius: BorderRadius.circular(20),
    );
  }

  static BoxDecoration grayDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      border: Border.all(color: ColorsClass.border_color),
    );
  }

  static BoxDecoration grayDecoration2() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: ColorsClass.border_color),
    );
  }

  static BoxDecoration grayDecorationForSmall(bool smallOrnot) {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
      border: smallOrnot ? Border.all(color: ColorsClass.border_color) : null,
    );
  }

  static BoxDecoration grayDecoration3() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: ColorsClass.lightGrey),
    );
  }
}
