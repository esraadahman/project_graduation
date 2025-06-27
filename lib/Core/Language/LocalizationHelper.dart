import 'package:gradution_project/Core/Imports/common_imports.dart';

class LangClass {
  static String translate(BuildContext context, String key) {
    return AppLoalization.of(context)!.translate(key);
  }
}
