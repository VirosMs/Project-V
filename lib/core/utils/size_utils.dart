import 'package:flutter/material.dart';

/// This file contains utility classes and extensions related to screen size and responsiveness.

/// The width of the Figma design used as a reference for creating the UI responsively.
const num FIGMA_DESIGN_WIDTH = 360;

/// The height of the Figma design used as a reference for creating the UI responsively.
const num FIGMA_DESIGN_HEIGHT = 800;

/// The height of the status bar in the Figma design.
const num FIGMA_DESIGN_STATUS_BAR = 0;

/// A function type used for building responsive widgets.
typedef ResponsiveBuild = Widget Function(
  BuildContext context,
  Orientation orientation,
  DeviceType deviceType,
);

/// A widget that provides responsiveness to its child widgets based on the device's orientation and type.
class Sizer extends StatelessWidget {
  const Sizer({
    Key? key,
    required this.builder,
  }) : super(key: key);

  /// Builds the widget whenever the orientation changes.
  final ResponsiveBuild builder;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        SizeUtils.setScreenSize(constraints, orientation);
        return builder(context, orientation, SizeUtils.deviceType);
      });
    });
  }
}

/// A utility class that provides information about the device's screen size and type.
class SizeUtils {
  /// The device's BoxConstraints.
  static late BoxConstraints boxConstraints;

  /// The device's orientation.
  static late Orientation orientation;

  /// The type of device (mobile, tablet, desktop).
  static late DeviceType deviceType;

  /// The device's height.
  static late double height;

  /// The device's width.
  static late double width;

  /// Sets the screen size based on the given constraints and orientation.
  static void setScreenSize(
    BoxConstraints constraints,
    Orientation currentOrientation,
  ) {
    boxConstraints = constraints;
    orientation = currentOrientation;

    if (orientation == Orientation.portrait) {
      width = boxConstraints.maxWidth.isNonZero(defaultValue: FIGMA_DESIGN_WIDTH);
      height = boxConstraints.maxHeight.isNonZero();
    } else {
      width = boxConstraints.maxHeight.isNonZero(defaultValue: FIGMA_DESIGN_WIDTH);
      height = boxConstraints.maxWidth.isNonZero();
    }
    deviceType = DeviceType.mobile;
  }
}

/// An extension that provides responsive methods for setting padding, margin, height, and width based on the device's viewport.
extension ResponsiveExtension on num {
  /// Returns the device's viewport width.
  double get _width => SizeUtils.width;

  /// Returns the device's viewport height.
  double get _height => SizeUtils.height;

  /// Sets the padding/margin (for the left and right side) and width of the screen or widget according to the viewport width.
  double get h => ((this * _width) / FIGMA_DESIGN_WIDTH);

  /// Sets the padding/margin (for the top and bottom side) and height of the screen or widget according to the viewport height.
  double get v =>
      (this * _height) / (FIGMA_DESIGN_HEIGHT - FIGMA_DESIGN_STATUS_BAR);

  /// Sets the smallest pixel value in image height and width.
  double get adaptSize {
    var height = v;
    var width = h;
    return height < width ? height.toDoubleValue() : width.toDoubleValue();
  }

  /// Sets the text font size according to the viewport.
  double get fSize => adaptSize;
}

/// An extension that provides formatting methods for double values.
extension FormatExtension on double {
  /// Returns a double value formatted according to the provided fractionDigits.
  double toDoubleValue({int fractionDigits = 2}) {
    return double.parse(this.toStringAsFixed(fractionDigits));
  }

  /// Returns the value itself if it is greater than 0, otherwise returns the defaultValue.
  double isNonZero({num defaultValue = 0.0}) {
    return this > 0 ? this : defaultValue.toDouble();
  }
}

/// An enumeration representing the type of device (mobile, tablet, desktop).
enum DeviceType { mobile, tablet, desktop }
