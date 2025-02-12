import 'dart:ui';

import 'package:flutter/material.dart';

class ColorsClass {
  static const Color primary = Color(0xFF004EA0);
  static const Color background = Color(0xB8FFFFFF);
  static const Color date = Color(0xFF778399);
  static const Color sub_text = Color(0xFF6B7280);
  static const Color text = Color(0xFF1F2937);
  static const Color copyRights = Color(0xFF041A47);
  static const Color errorcolor = Color.fromARGB(255, 198, 18, 18);

  static const Color homeCardText = Color(0xFF232360);
  static const Color password_text = Color(0xFF6B7280);
  static const Color dark_gradient = Color(0xFF002572);
  static const Color light_gradient = Color(0xFF007BFF);
  static const Color checkBoxText = Color(0xB2000000);
  static const Color lightGrey = Color(0xFFDDDDDD);
  static const Color lightBlue = Color.fromARGB(255, 192, 220, 251);

  //! colors for the on boarding screen

  static const Color onBoard = Color(0xFF003268);
  static const Color colorwhite = Colors.white;

  static const Color border_color = Color.fromARGB(255, 178, 184, 196);
  static const LinearGradient appGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      dark_gradient,
      light_gradient,
    ],
  );

  static const Color complateColorText = Color(0xFF374151);
  static const Color buttonColorPrimary = Color(0xFFF5FAFF);

// static const  Color dark_gradient2 = Color(0xFF374151);
// static const Color light_gradient2 = Color(0xFF7C9EB2);

// static const LinearGradient workSpaceBackground = LinearGradient(
//   begin: Alignment.topLeft,
//   end: Alignment.bottomRight,
//   colors: [
//     dark_gradient2,
//     light_gradient2,
//   ],
// );

  static const LinearGradient workSpaceBackground = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.bottomRight,
    colors: [
      Color.fromARGB(255, 66, 146, 232),
      Color.fromARGB(255, 115, 171, 224),
      Color.fromARGB(255, 177, 217, 248),
      Color.fromARGB(255, 137, 185, 213),
    ],
  );
}
