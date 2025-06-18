import 'package:flutter/material.dart';

class AppPalette {
  // Primary Colors (Inspired by luxury car brands)
  static const Color midnightBlue = Color(0xFF0F1A3C);
  static const Color carbonBlack = Color(0xFF1A1A1A);
  static const Color titaniumSilver = Color(0xFFD9D9D9);
  static const Color racingRed = Color(0xFFD40000);
  static const Color goldAccent = Color(0xFFD4AF37);

  // Secondary Colors
  static const Color deepOcean = Color(0xFF003366);
  static const Color steelGray = Color(0xFF4D4D4D);
  static const Color pearlWhite = Color(0xFFF5F5F5);
  static const Color electricBlue = Color(0xFF0066CC);

  // Status Colors
  static const Color successGreen = Color(0xFF2E7D32);
  static const Color warningAmber = Color(0xFFFFA000);
  static const Color errorRed = Color(0xFFC62828);
  static const Color infoBlue = Color(0xFF0277BD);

  // Text Colors
  static const Color primaryText = Colors.white;
  static const Color secondaryText = Color(0xFFB3B3B3);
  static const Color disabledText = Color(0xFF666666);
  static const Color accentText = goldAccent;

  // Background Colors
  static const Color primaryBackground = carbonBlack;
  static const Color secondaryBackground = Color(0xFF252525);
  static const Color surfaceColor = Color(0xFF333333);
  static const Color cardColor = Color(0xFF2A2A2A);
  static const Color scaffoldBackground = Colors.black;

  // Typography
  static const String fontFamily = 'Roboto';
  static const double displayLarge = 32.0;
  static const double displayMedium = 28.0;
  static const double displaySmall = 24.0;
  static const double headlineLarge = 22.0;
  static const double headlineMedium = 20.0;
  static const double headlineSmall = 18.0;
  static const double titleLarge = 16.0;
  static const double titleMedium = 14.0;
  static const double titleSmall = 12.0;
  static const double bodyLarge = 16.0;
  static const double bodyMedium = 14.0;
  static const double bodySmall = 12.0;
  static const double labelLarge = 14.0;
  static const double labelMedium = 12.0;
  static const double labelSmall = 10.0;
}

class AppTheme {
  static ThemeData darkTheme() {
    return ThemeData.dark().copyWith(
      scaffoldBackgroundColor: AppPalette.scaffoldBackground,

      colorScheme: const ColorScheme.dark(
        primary: AppPalette.racingRed,
        secondary: AppPalette.goldAccent,
        surface: AppPalette.surfaceColor,
        error: AppPalette.errorRed,
        onPrimary: AppPalette.primaryText,
        onSecondary: AppPalette.primaryText,
        onSurface: AppPalette.primaryText,
        onError: AppPalette.primaryText,
      ),

      // Text Theme
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontSize: AppPalette.displayLarge,
          fontWeight: FontWeight.bold,
          color: AppPalette.primaryText,
        ),
        displayMedium: TextStyle(
          fontSize: AppPalette.displayMedium,
          fontWeight: FontWeight.bold,
          color: AppPalette.primaryText,
        ),
        displaySmall: TextStyle(
          fontSize: AppPalette.displaySmall,
          fontWeight: FontWeight.bold,
          color: AppPalette.primaryText,
        ),
        headlineLarge: TextStyle(
          fontSize: AppPalette.headlineLarge,
          fontWeight: FontWeight.w600,
          color: AppPalette.primaryText,
        ),
        headlineMedium: TextStyle(
          fontSize: AppPalette.headlineMedium,
          fontWeight: FontWeight.w600,
          color: AppPalette.primaryText,
        ),
        headlineSmall: TextStyle(
          fontSize: AppPalette.headlineSmall,
          fontWeight: FontWeight.w600,
          color: AppPalette.primaryText,
        ),
        titleLarge: TextStyle(
          fontSize: AppPalette.titleLarge,
          fontWeight: FontWeight.w500,
          color: AppPalette.primaryText,
        ),
        titleMedium: TextStyle(
          fontSize: AppPalette.titleMedium,
          fontWeight: FontWeight.w500,
          color: AppPalette.primaryText,
        ),
        titleSmall: TextStyle(
          fontSize: AppPalette.titleSmall,
          fontWeight: FontWeight.w500,
          color: AppPalette.secondaryText,
        ),
        bodyLarge: TextStyle(
          fontSize: AppPalette.bodyLarge,
          color: AppPalette.primaryText,
        ),
        bodyMedium: TextStyle(
          fontSize: AppPalette.bodyMedium,
          color: AppPalette.primaryText,
        ),
        bodySmall: TextStyle(
          fontSize: AppPalette.bodySmall,
          color: AppPalette.secondaryText,
        ),
        labelLarge: TextStyle(
          fontSize: AppPalette.labelLarge,
          fontWeight: FontWeight.w500,
          color: AppPalette.primaryText,
        ),
        labelMedium: TextStyle(
          fontSize: AppPalette.labelMedium,
          color: AppPalette.secondaryText,
        ),
        labelSmall: TextStyle(
          fontSize: AppPalette.labelSmall,
          color: AppPalette.disabledText,
        ),
      ),

      // Button Themes
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppPalette.racingRed,
          foregroundColor: AppPalette.primaryText,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          elevation: 2,
          textStyle: const TextStyle(
            fontSize: AppPalette.labelLarge,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppPalette.primaryText,
          side: const BorderSide(color: AppPalette.titaniumSilver),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          textStyle: const TextStyle(
            fontSize: AppPalette.labelLarge,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppPalette.goldAccent,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          textStyle: const TextStyle(
            fontSize: AppPalette.labelLarge,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      // Input Decoration Theme
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppPalette.secondaryBackground,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppPalette.steelGray),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppPalette.goldAccent, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppPalette.errorRed),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppPalette.errorRed, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
        hintStyle: const TextStyle(
          color: AppPalette.disabledText,
          fontSize: AppPalette.bodyMedium,
        ),
        labelStyle: const TextStyle(
          color: AppPalette.secondaryText,
          fontSize: AppPalette.bodyMedium,
        ),
        errorStyle: const TextStyle(
          color: AppPalette.errorRed,
          fontSize: AppPalette.labelSmall,
        ),
      ),

      // Card Theme
      cardTheme: CardTheme(
        color: AppPalette.cardColor,
        elevation: 2,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),

      // AppBar Theme
      appBarTheme: const AppBarTheme(
        backgroundColor: AppPalette.midnightBlue,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontSize: AppPalette.headlineMedium,
          fontWeight: FontWeight.w600,
          color: AppPalette.primaryText,
        ),
        iconTheme: IconThemeData(color: AppPalette.primaryText),
      ),

      // Bottom Navigation Bar Theme
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppPalette.midnightBlue,
        selectedItemColor: AppPalette.goldAccent,
        unselectedItemColor: AppPalette.secondaryText,
        elevation: 8,
        type: BottomNavigationBarType.fixed,
      ),

      // Progress Indicator Theme
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppPalette.goldAccent,
        linearTrackColor: AppPalette.steelGray,
        circularTrackColor: AppPalette.steelGray,
      ),

      // Divider Theme
      dividerTheme: const DividerThemeData(
        color: AppPalette.steelGray,
        thickness: 1,
        space: 0,
      ),

      // Floating Action Button Theme
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppPalette.racingRed,
        foregroundColor: AppPalette.primaryText,
        elevation: 4,
      ),

      // SnackBar Theme
      snackBarTheme: SnackBarThemeData(
        backgroundColor: AppPalette.surfaceColor,
        contentTextStyle: TextStyle(
          color: AppPalette.primaryText,
          fontSize: AppPalette.bodyMedium,
        ),
        actionTextColor: AppPalette.goldAccent,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}
