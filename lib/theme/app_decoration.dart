import 'package:flutter/material.dart';
import 'package:project_v/core/app_export.dart';

class AppDecoration {
  // Fill decorations
  static BoxDecoration get fillGreenA => BoxDecoration(
        color: appTheme.greenA100,
      );
  static BoxDecoration get fillOnPrimary => BoxDecoration(
        color: theme.colorScheme.onPrimary,
      );

  // Gradient decorations
  static BoxDecoration get gradientOnPrimaryToBlack => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.5, 0),
          end: Alignment(0.5, 1),
          colors: [
            theme.colorScheme.onPrimary.withOpacity(0),
            appTheme.black900.withOpacity(0.5),
          ],
        ),
      );
}

class BorderRadiusStyle {
  // Circle borders
  static BorderRadius get circleBorder16 => BorderRadius.circular(
        16.h,
      );

  // Custom borders
  static BorderRadius get customBorderTL28 => BorderRadius.horizontal(
        left: Radius.circular(28.h),
      );
  static BorderRadius get customBorderTL4 => BorderRadius.vertical(
        top: Radius.circular(4.h),
      );

  // Rounded borders
  static BorderRadius get roundedBorder12 => BorderRadius.circular(
        12.h,
      );
  static BorderRadius get roundedBorder28 => BorderRadius.circular(
        28.h,
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
