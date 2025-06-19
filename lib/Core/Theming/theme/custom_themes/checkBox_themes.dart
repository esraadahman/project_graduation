import 'package:flutter/material.dart';

class CheckboxThemes {
  CheckboxThemes._();
  static final CheckboxThemeData lightThemeCheckbox = CheckboxThemeData(
    fillColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return Colors.blue; // Color when checked
      }
      return Colors.grey.shade300; // Color when unchecked
    }),
    checkColor: WidgetStateProperty.all(Colors.white), // Checkmark color
    overlayColor: WidgetStateProperty.all(Colors.blue),
    splashRadius: 20,
    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
  );
  // dark theme
  static final CheckboxThemeData darkThemeCheckbox = CheckboxThemeData(
    fillColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return Colors.purple; // Color when checked
      }
      return Colors.grey.shade700; // Color when unchecked
    }),
    checkColor: WidgetStateProperty.all(Colors.black), // Checkmark color
    overlayColor: WidgetStateProperty.all(Colors.purple),
    splashRadius: 20,
    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
  );
}
