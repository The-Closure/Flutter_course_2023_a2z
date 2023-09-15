import 'package:flutter/material.dart';
import 'package:padding_and/resources/color_schema.dart';

ThemeData mytheme = ThemeData(
  dividerTheme: DividerThemeData(color: secondary, thickness: 5),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStatePropertyAll(Colors.red),
    ),
  ),
);
