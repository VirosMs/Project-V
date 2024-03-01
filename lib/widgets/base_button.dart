import 'package:flutter/material.dart';

/// A base button widget that can be customized with different styles and text.
class BaseButton extends StatelessWidget {
  /// Creates a [BaseButton].
  ///
  /// The [text] parameter is required and specifies the text to be displayed on the button.
  /// The [onPressed] parameter is a callback function that will be called when the button is pressed.
  /// The [buttonStyle] parameter allows customization of the button's visual appearance.
  /// The [buttonTextStyle] parameter allows customization of the text style of the button.
  /// The [isDisabled] parameter indicates whether the button is disabled or not.
  /// The [height] parameter specifies the height of the button.
  /// The [width] parameter specifies the width of the button.
  /// The [margin] parameter specifies the margin around the button.
  /// The [alignment] parameter specifies the alignment of the button within its parent widget.
  BaseButton({
    Key? key,
    required this.text,
    this.onPressed,
    this.buttonStyle,
    this.buttonTextStyle,
    this.isDisabled,
    this.height,
    this.width,
    this.margin,
    this.alignment,
  }) : super(
          key: key,
        );

  /// The text to be displayed on the button.
  final String text;

  /// A callback function that will be called when the button is pressed.
  final VoidCallback? onPressed;

  /// The visual appearance of the button.
  final ButtonStyle? buttonStyle;

  /// The text style of the button.
  final TextStyle? buttonTextStyle;

  /// Indicates whether the button is disabled or not.
  final bool? isDisabled;

  /// The height of the button.
  final double? height;

  /// The width of the button.
  final double? width;

  /// The margin around the button.
  final EdgeInsets? margin;

  /// The alignment of the button within its parent widget.
  final Alignment? alignment;

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}
