import 'package:flutter/material.dart';
import 'package:project_graduation/core/Theming/colors/colors.dart';

class CustomDecoration {
  static BoxDecoration decorationForCenterContainer() {
    return BoxDecoration(
      color: ColorsClass.background,
      borderRadius: BorderRadius.circular(20),
    );
  }
}
