import 'package:flutter/material.dart';

class AppTheme {

  static final light = ThemeData.light().copyWith(
        scrollbarTheme: const ScrollbarThemeData().copyWith(
          thumbColor: MaterialStateProperty.all(Colors.grey.withOpacity(.5))
        )
      );

}