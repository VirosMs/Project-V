import 'package:flutter/material.dart';
import 'package:project_v/core/app_export.dart';

/// A class that provides various decoration styles for the app.
class AppDecoration {
  /// Returns a BoxDecoration with a green color.
  static BoxDecoration get fillGreenA => BoxDecoration(
        color: appTheme.greenA100,
      );

  /// Returns a BoxDecoration with the color defined in the app's theme's onPrimary property.
  static BoxDecoration get fillOnPrimary => BoxDecoration(
        color: theme.colorScheme.onPrimary,
      );

  /// Returns a BoxDecoration with a gradient from the app's theme's onPrimary color to black.
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

/// A class that provides various border radius styles.
class BorderRadiusStyle {
  /// Returns a BorderRadius with a circular border of radius 16.
  static BorderRadius get circleBorder16 => BorderRadius.circular(
        16.h,
      );

  /// Returns a BorderRadius with a horizontal custom border of radius 28.
  static BorderRadius get customBorderTL28 => BorderRadius.horizontal(
        left: Radius.circular(28.h),
      );

  /// Returns a BorderRadius with a vertical custom border of radius 4.
  static BorderRadius get customBorderTL4 => BorderRadius.vertical(
        top: Radius.circular(4.h),
      );

  /// Returns a BorderRadius with a circular border of radius 12.
  static BorderRadius get roundedBorder12 => BorderRadius.circular(
        12.h,
      );

  /// Returns a BorderRadius with a circular border of radius 28.
  static BorderRadius get roundedBorder28 => BorderRadius.circular(
        28.h,
      );
}

// Comment/Uncomment the below code based on your Flutter SDK version.

// For Flutter SDK Version 3.7.2 or greater.

/// Returns the stroke alignment value for inside.
double get strokeAlignInside => BorderSide.strokeAlignInside;

/// Returns the stroke alignment value for center.
double get strokeAlignCenter => BorderSide.strokeAlignCenter;

/// Returns the stroke alignment value for outside.
double get strokeAlignOutside => BorderSide.strokeAlignOutside;

// For Flutter SDK Version 3.7.1 or less.

// StrokeAlign get strokeAlignInside => StrokeAlign.inside;
//
// StrokeAlign get strokeAlignCenter => StrokeAlign.center;
//
// StrokeAlign get strokeAlignOutside => StrokeAlign.outside;
