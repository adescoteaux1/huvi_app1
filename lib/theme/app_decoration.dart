import 'package:flutter/material.dart';
import 'package:huvi_app1/core/app_export.dart';

class AppDecoration {
  // Fill decorations
  static BoxDecoration get fillGray => BoxDecoration(
        color: appTheme.gray100,
      );
  static BoxDecoration get fillGray50 => BoxDecoration(
        color: appTheme.gray50,
      );
  static BoxDecoration get fillWhiteA => BoxDecoration(
        color: appTheme.whiteA700,
      );
  static BoxDecoration get fillYellow => BoxDecoration(
        color: appTheme.yellow700.withOpacity(0.68),
      );

  // Gradient decorations
  static BoxDecoration get gradientYellowToYellow => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.52, 0.09),
          end: Alignment(0.52, 1.09),
          colors: [
            appTheme.yellow600,
            appTheme.yellow600.withOpacity(0.65),
            appTheme.yellow600.withOpacity(0),
          ],
        ),
      );

  // Outline decorations
  static BoxDecoration get outlineBlack => BoxDecoration(
        color: appTheme.gray300,
        border: Border.all(
          color: appTheme.black90001,
          width: 1.h,
          strokeAlign: strokeAlignOutside,
        ),
      );
  static BoxDecoration get outlineBlack90001 => BoxDecoration(
        border: Border(
          top: BorderSide(
            color: appTheme.black90001,
            width: 1.h,
          ),
          bottom: BorderSide(
            color: appTheme.black90001,
            width: 1.h,
          ),
        ),
      );
  static BoxDecoration get outlineBlack900011 => BoxDecoration(
        color: appTheme.gray50,
        border: Border.all(
          color: appTheme.black90001,
          width: 1.h,
          strokeAlign: strokeAlignOutside,
        ),
      );
  static BoxDecoration get outlineBlueGray => BoxDecoration(
        color: appTheme.lightBlue400,
        boxShadow: [
          BoxShadow(
            color: appTheme.blueGray400,
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              0,
              3,
            ),
          ),
        ],
      );
      
  static BoxDecoration get fillTeal => BoxDecoration(
        color: appTheme.teal400,
      );
  static BoxDecoration get outlineBlueGrayF => BoxDecoration(
        color: appTheme.whiteA700,
        boxShadow: [
          BoxShadow(
            color: appTheme.blueGray9004f,
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              0,
              0,
            ),
          ),
        ],
      );
  static BoxDecoration get outlineOnSecondaryContainer => BoxDecoration(
        color: appTheme.whiteA700,
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.onSecondaryContainer,
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              0,
              2,
            ),
          ),
        ],
      );
  static BoxDecoration get outlinePrimary => BoxDecoration();
}

class BorderRadiusStyle {
  // Rounded borders
  static BorderRadius get roundedBorder10 => BorderRadius.circular(
        10.h,
      );
  static BorderRadius get roundedBorder74 => BorderRadius.circular(
        74.h,
      );
  static BorderRadius get roundedBorder24 => BorderRadius.circular(
        24.h,
      );
}

// Comment/Uncomment the below code based on your Flutter SDK version.

// For Flutter SDK Version 3.7.2 or greater.

double get strokeAlignInside => BorderSide.strokeAlignInside;

double get strokeAlignCenter => BorderSide.strokeAlignCenter;

double get strokeAlignOutside => BorderSide.strokeAlignOutside;

// For Flutter SDK Version 3.7.1 or less.

// StrokeAlign get strokeAlignInside => StrokeAlign.inside;
//
// StrokeAlign get strokeAlignCenter => StrokeAlign.center;
//
// StrokeAlign get strokeAlignOutside => StrokeAlign.outside;
