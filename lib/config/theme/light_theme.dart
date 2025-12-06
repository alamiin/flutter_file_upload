import 'package:flutter/material.dart';

import '../../core/constants/colors.dart';

ThemeData lightTheme = ThemeData(
  primaryColor: Colors.blue,
  brightness: Brightness.light,

  // ✅ Define your color scheme
  colorScheme: const ColorScheme.light(
    primary: Colors.blue,           // main brand color
    secondary: Colors.orange,       // accent color
    background: grey900,
    surface: Colors.white,
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    onBackground: Colors.white,
    onSurface: Colors.black,
  ),

  useMaterial3: true,
);