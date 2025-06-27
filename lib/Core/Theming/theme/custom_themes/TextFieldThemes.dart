import 'package:gradution_project/Core/Imports/common_imports.dart';

class TextFieldThemes {
  TextFieldThemes._();

  // Light theme TextField style
  static final InputDecorationTheme lightTextFieldTheme = InputDecorationTheme(
    filled: true,
    fillColor: Colors.grey.shade200, // Background color
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: Colors.blue.shade300, width: 1.5),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide:
          // for no border
          //   BorderSide.none
          BorderSide(color: Colors.blue.shade300, width: 1.5),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Colors.blue, width: 2),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: Colors.red.shade300, width: 1.5),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Colors.red, width: 2),
    ),
    labelStyle: const TextStyle(color: Colors.black87),
    hintStyle: const TextStyle(color: Colors.black54),
    prefixIconColor: Colors.blue,
    suffixIconColor: Colors.blue,
  );

  // Dark theme TextField style
  static final InputDecorationTheme darkTextFieldTheme = InputDecorationTheme(
    filled: true,
    fillColor: const Color.fromARGB(255, 110, 110, 110), // Background color
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(
          color: const Color.fromARGB(255, 251, 251, 251), width: 1.5),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(
          color: const Color.fromARGB(255, 236, 235, 236), width: 1.5),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide:
          const BorderSide(color: Color.fromARGB(255, 255, 255, 255), width: 2),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: Colors.red.shade300, width: 1.5),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Colors.red, width: 2),
    ),
    labelStyle: const TextStyle(color: Colors.white70),
    hintStyle: const TextStyle(color: Colors.white54),
    prefixIconColor: const Color.fromARGB(255, 248, 248, 248),
    suffixIconColor: const Color.fromARGB(255, 229, 228, 230),
  );
}
