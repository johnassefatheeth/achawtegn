import 'package:flutter/material.dart';

// light mode theme with specific colors for background, primary, secondary, and tertiary elements.
ThemeData lightmode = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
        background: Color.fromARGB(255, 151, 156, 162),
        primary: Color.fromARGB(255, 153, 168, 227),
        secondary: Color.fromARGB(252, 58, 55, 101),
        tertiary: Color.fromARGB(255, 232, 238, 244)));

//dark mode theme with specific colors for background, primary, secondary, and tertiary elements.
ThemeData darkMode = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
        background: Color.fromARGB(255, 3, 1, 34),
        primary: Color.fromARGB(248, 71, 71, 217),
        secondary: Color.fromARGB(255, 50, 0, 89),
        tertiary: Color.fromARGB(255, 7, 29, 58)));
