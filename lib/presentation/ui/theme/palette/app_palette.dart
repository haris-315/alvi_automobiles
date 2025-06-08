import 'package:flutter/material.dart';

class AppPalette {
  static final primaryTextColor = Colors.white.withValues(alpha: .32);

  static ThemeData appTheme() => ThemeData.dark().copyWith(
    primaryColorDark: primaryTextColor,
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        side: WidgetStateBorderSide.resolveWith(
          (_) => BorderSide(color: Colors.white70),
        ),
        backgroundColor: WidgetStateColor.transparent,
        foregroundColor: WidgetStateProperty.resolveWith(
          (_) => primaryTextColor,
        ),
        splashFactory: InkSparkle.splashFactory,
        shape: WidgetStateProperty.resolveWith((_) => RoundedRectangleBorder()),
      ),
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(
      
    )
  );
}
