import 'package:gradution_project/Core/Imports/common_imports.dart';

class Themes {
  Themes._();
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true, // Enables Material 3
    fontFamily: 'poppins',
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    // contain all types of text themes
    textTheme: Text_Theme.lightThemeText,
    // contain all types of elevated button themes
    elevatedButtonTheme: ElevatedButton_Theme.lightThemeElevatedButton,
    appBarTheme: Appbar_Theme.lightThemeAppBar,
    bottomSheetTheme: Bottomsheettheme.lightThemeBottomSheet,
    checkboxTheme: CheckboxThemes.lightThemeCheckbox,
    chipTheme: ChipThemes.lightChipTheme,
    inputDecorationTheme: TextFieldThemes.lightTextFieldTheme,
    floatingActionButtonTheme: Floatingactionbuttonthemes.lightTheme,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true, // Enables Material 3
    fontFamily: 'poppins',
    brightness: Brightness.dark,
    primaryColor: Colors.purple,
    scaffoldBackgroundColor: const Color.fromARGB(255, 13, 13, 13),
    textTheme: Text_Theme.darkThemeText,
    elevatedButtonTheme: ElevatedButton_Theme.darkThemeElevatedButton,
    appBarTheme: Appbar_Theme.darkThemeAppBar,
    bottomSheetTheme: Bottomsheettheme.darkThemeBottomSheet,
    checkboxTheme: CheckboxThemes.darkThemeCheckbox,
    chipTheme: ChipThemes.darkChipTheme,
    inputDecorationTheme: TextFieldThemes.darkTextFieldTheme,
    floatingActionButtonTheme: Floatingactionbuttonthemes.darkTheme,
    //   bottomNavigationBarTheme: bottomNavigationBarTheme.
  );
}
