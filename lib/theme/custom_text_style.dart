import 'package:flutter/material.dart';
import '../core/app_export.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.
class CustomTextStyles {
  /// The body large text style on the primary container.
  static get bodyLargeOnPrimaryContainer => theme.textTheme.bodyLarge!.copyWith(
        color: theme.colorScheme.onPrimaryContainer,
      );

  /// The label large text style with gray900 color and a font weight of w600.
  static get labelLargeGray900 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.gray900,
        fontWeight: FontWeight.w600,
      );

  /// The medium title text style on the primary color.
  static get titleMediumOnPrimary => theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.onPrimary,
      );

  /// The small title text style on the primary color.
  static get titleSmallOnPrimary => theme.textTheme.titleSmall!.copyWith(
        color: theme.colorScheme.onPrimary,
      );

  /// The small title text style with a color of #FF000000.
  static get titleSmallff000000 => theme.textTheme.titleSmall!.copyWith(
        color: Color(0XFF000000),
      );

  /// The small title text style with a color of #FF35693E.
  static get titleSmallff35693e => theme.textTheme.titleSmall!.copyWith(
        color: Color(0XFF35693E),
      );
}

/// Extension on [TextStyle] to easily apply the Roboto font family.
extension on TextStyle {
  /// Returns a copy of the text style with the Roboto font family applied.
  TextStyle get roboto {
    return copyWith(
      fontFamily: 'Roboto',
    );
  }
}
