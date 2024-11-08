import 'package:flutter/material.dart';
import 'package:project_graduation/Core/Language/applocalization.dart';

class LangClass {
  static String translate(BuildContext context, String key) {
    return AppLoalization.of(context)!.translate(key);
  }
}
