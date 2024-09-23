import 'dart:ui';

import 'package:flutter/material.dart';

class ColorsClass{

static const Color primary =Color(0xFF004EA0);
static const Color background =Color(0xB8FFFFFF);
static const Color sub_text= Color(0xFF6B7280);
static const Color text= Color(0xFF1F2937);
static const Color  copyRights =Color(0xFF041A47);
static const Color colorwhite =Colors.white;
static const Color  errorcolor =Color.fromARGB(255, 198, 18, 18);

static const Color password_text =Color(0xFF6B7280);
static const Color dark_gradient =Color(0xFF002572);
static const Color light_gradient =Color(0xFF007BFF);
static const Color checkBoxText =Color(0xB2000000);


static const LinearGradient appGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      dark_gradient,
      light_gradient,
    ],
  );


}