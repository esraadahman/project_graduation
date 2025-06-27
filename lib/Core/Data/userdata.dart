import 'package:gradution_project/Core/Imports/common_imports.dart';

class UserPreferences {
  static final Box box = Hive.box(HiveConstants.Boxname);

  static String get userName =>
      box.get(ApiKey.name, defaultValue: "User") as String;
}
