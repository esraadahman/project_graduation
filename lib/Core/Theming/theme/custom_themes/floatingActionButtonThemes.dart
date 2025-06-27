import 'package:gradution_project/Core/Imports/common_imports.dart';

class Floatingactionbuttonthemes {
  Floatingactionbuttonthemes._();
  static const lightTheme = FloatingActionButtonThemeData(
    backgroundColor: Colors.blue,
    foregroundColor: Colors.white,
    focusColor: Colors.white,
    hoverColor: Colors.white,
    splashColor: Colors.white,
    elevation: 4,
    focusElevation: 6,
    hoverElevation: 6,
    disabledElevation: 0,
    highlightElevation: 8,
    shape: CircleBorder(),
  );

  static const darkTheme = FloatingActionButtonThemeData(
    backgroundColor: Colors.purple,
    foregroundColor: Colors.black,
    focusColor: Colors.black,
    hoverColor: Colors.black,
    splashColor: Colors.black,
    elevation: 4,
    focusElevation: 6,
    hoverElevation: 6,
    disabledElevation: 0,
    highlightElevation: 8,
    shape: CircleBorder(),
  );
}
