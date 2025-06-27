import 'package:gradution_project/Core/Imports/common_imports.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  static const String key = 'theme_mode';
  static final Box box = Hive.box(HiveConstants.Boxname);

  ThemeCubit() : super(_getInitialTheme());

  static ThemeMode _getInitialTheme() {
    final isDark = box.get(key, defaultValue: false);
    return isDark ? ThemeMode.dark : ThemeMode.light;
  }

  void toggleTheme(bool isDark) {
    print('Theme toggled to: ${isDark ? "Dark" : "Light"}');
    box.put(key, isDark);
    emit(isDark ? ThemeMode.dark : ThemeMode.light);
  }
}
