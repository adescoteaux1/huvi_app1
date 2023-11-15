// ignore_for_file: prefer_const_constructors

import 'dart:ui';
import 'package:flutter/material.dart';
import '../../core/app_export.dart';

String _appTheme = "primary";

/// Helper class for managing themes and colors.
class ThemeHelper {
  // A map of custom color themes supported by the app
  Map<String, PrimaryColors> _supportedCustomColor = {
    'primary': PrimaryColors()
  };

// A map of color schemes supported by the app
  Map<String, ColorScheme> _supportedColorScheme = {
    'primary': ColorSchemes.primaryColorScheme
  };

  /// Changes the app theme to [_newTheme].
  void changeTheme(String _newTheme) {
    _appTheme = _newTheme;
  }

  /// Returns the primary colors for the current theme.
  PrimaryColors _getThemeColors() {
    //throw exception to notify given theme is not found or not generated by the generator
    if (!_supportedCustomColor.containsKey(_appTheme)) {
      throw Exception(
          "$_appTheme is not found.Make sure you have added this theme class in JSON Try running flutter pub run build_runner");
    }
    //return theme from map

    return _supportedCustomColor[_appTheme] ?? PrimaryColors();
  }

  /// Returns the current theme data.
  ThemeData _getThemeData() {
    //throw exception to notify given theme is not found or not generated by the generator
    if (!_supportedColorScheme.containsKey(_appTheme)) {
      throw Exception(
          "$_appTheme is not found.Make sure you have added this theme class in JSON Try running flutter pub run build_runner");
    }
    //return theme from map

    var colorScheme =
        _supportedColorScheme[_appTheme] ?? ColorSchemes.primaryColorScheme;
    return ThemeData(
      visualDensity: VisualDensity.standard,
      colorScheme: colorScheme,
      textTheme: TextThemes.textTheme(colorScheme),
      scaffoldBackgroundColor: appTheme.gray100,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.h),
          ),
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.transparent,
          side: BorderSide(
            color: appTheme.black90001,
            width: 1.h,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.h),
          ),
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      dividerTheme: DividerThemeData(
        thickness: 1,
        space: 1,
        color: appTheme.blueGray400,
      ),
    );
  }

  /// Returns the primary colors for the current theme.
  PrimaryColors themeColor() => _getThemeColors();

  /// Returns the current theme data.
  ThemeData themeData() => _getThemeData();
}

/// Class containing the supported text theme styles.
class TextThemes {
  static TextTheme textTheme(ColorScheme colorScheme) => TextTheme(
        bodyLarge: TextStyle(
          color: appTheme.yellow900,
          fontSize: 16.fSize,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: TextStyle(
          color: appTheme.blueGray400,
          fontSize: 14.fSize,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
        ),
        bodySmall: TextStyle(
          color: Colors.black,
          fontSize: 12.fSize,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
        ),
        displayMedium: TextStyle(
          color: colorScheme.primary,
          fontSize: 50.fSize,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w700,
        ),
        headlineLarge: TextStyle(
          color: colorScheme.primary,
          fontSize: 32.fSize,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w600,
        ),
        headlineMedium: TextStyle(
          color: colorScheme.primary,
          fontSize: 28.fSize,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w600,
        ),
        headlineSmall: TextStyle(
          color: appTheme.yellow900,
          fontSize: 24.fSize,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w700,
        ),
        labelLarge: TextStyle(
          color: colorScheme.primaryContainer,
          fontSize: 12.fSize,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w700,
        ),
        titleLarge: TextStyle(
          color: appTheme.black90001,
          fontSize: 22.fSize,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w600,
        
        ),
        titleMedium: TextStyle(
          color: appTheme.yellow900,
          fontSize: 16.fSize,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w700,
        ),
        titleSmall: TextStyle(
          color: appTheme.gray50,
          fontSize: 14.fSize,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w600,
        ),
        
      );
}

/// Class containing the supported color schemes.
class ColorSchemes {
  static final primaryColorScheme = ColorScheme.light(
    // Primary colors
    primary: Color(0XFF2DC1A6),
    primaryContainer: Color(0XFF1C1C1C),
    secondary: Color(0XFF1C1C1C),
    secondaryContainer: Color(0XFF1C1C1C),
    tertiary: Color(0XFF1C1C1C),
    tertiaryContainer: Color(0XFF246BF5),

    // Background colors
    background: Color(0XFF1C1C1C),

    // Surface colors
    surface: Color(0XFF1C1C1C),
    surfaceTint: Color(0XFF1D192B),
    surfaceVariant: Color(0XFF246BF5),

    // Error colors
    error: Color(0XFF1D192B),
    errorContainer: Color(0XFF246BF5),
    onError: Color(0XFF2DC1A6),
    onErrorContainer: Color(0XFF111827),

    // On colors(text colors)
    onBackground: Color(0XFF2DC1A6),
    onInverseSurface: Color(0XFF2DC1A6),
    onPrimary: Color(0XFF1D192B),
    onPrimaryContainer: Color(0XFF2DC1A6),
    onSecondary: Color(0XFF2DC1A6),
    onSecondaryContainer: Color(0XFF111827),
    onTertiary: Color(0XFF2DC1A6),
    onTertiaryContainer: Color(0XFF111827),

    // Other colors
    outline: Color(0XFF1D192B),
    outlineVariant: Color(0XFF1C1C1C),
    scrim: Color(0XFF1C1C1C),
    shadow: Color(0XFF1D192B),

    // Inverse colors
    inversePrimary: Color(0XFF1C1C1C),
    inverseSurface: Color(0XFF1D192B),

    // Pending colors
    onSurface: Color(0XFF2DC1A6),
    onSurfaceVariant: Color(0XFF111827),
  );
}

/// Class containing custom colors for a primary theme.
class PrimaryColors {
  // Black
  Color get black900 => Color(0XFF040504);
  Color get black90001 => Color(0XFF000000);

  // BlueGray
  Color get blueGray400 => Color(0XFF8784AC);
  Color get blueGray40001 => Color(0XFF888888);
  Color get blueGray600 => Color(0XFF64608A);

  // Gray
  Color get gray100 => Color(0XFFF1F1F9);
  Color get gray300 => Color(0XFFDADADA);
  Color get gray50 => Color(0XFFF8F7FF);

  // Indigo
  Color get indigo100 => Color(0XFFC6C5DE);

  // LightBlue
  Color get lightBlue400 => Color(0XFF24B6F5);

  // White
  Color get whiteA700 => Color(0XFFFFFFFF);

  // Yellow
  Color get yellow600 => Color(0XFFFCD62F);
  Color get yellow700 => Color(0XFFF5BD30);
  Color get yellow900 => Color(0XFFF47A28);

  // Blue
  Color get blue50 => Color(0XFFDBEAFE);

  // BlueGray
  Color get blueGray200 => Color(0XFFADABC9);
  Color get blueGray700 => Color(0XFF475569);

  // BlueGrayf
  Color get blueGray9004f => Color(0X4F091E42);

  // DeepOrange
  Color get deepOrangeA100 => Color(0XFFF5A570);

  // Gray
  Color get gray10001 => Color(0XFFF2F2F2);
  Color get gray500 => Color(0XFF969696);
  Color get gray5001 => Color(0XFFF8F7FF);
  Color get gray600 => Color(0XFF7C7C7C);
  Color get gray800 => Color(0XFF49454F);
  Color get gray900 => Color(0XFF1E1E1E);

  // Green
  Color get green900 => Color(0XFF00891E);

  // Indigo

  // LightBlue

  // Teal
  Color get teal400 => Color(0XFF2DC1A6);

  // White

  // Yellow
}

PrimaryColors get appTheme => ThemeHelper().themeColor();
ThemeData get theme => ThemeHelper().themeData();
