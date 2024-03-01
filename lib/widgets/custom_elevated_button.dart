import 'package:flutter/material.dart';
import '../core/app_export.dart';
import 'base_button.dart';

/// A custom elevated button widget that extends the [BaseButton] class.
class CustomElevatedButton extends BaseButton {
  /// The decoration to be applied to the button.
  final BoxDecoration? decoration;

  /// The widget to be displayed as the left icon of the button.
  final Widget? leftIcon;

  /// The widget to be displayed as the right icon of the button.
  final Widget? rightIcon;

  /// Creates a [CustomElevatedButton].
  ///
  /// The [text] parameter is required and specifies the text to be displayed on the button.
  /// The [key] parameter is an identifier for the button widget.
  /// The [margin] parameter specifies the margin around the button.
  /// The [onPressed] parameter is a callback function that is called when the button is pressed.
  /// The [buttonStyle] parameter specifies the style of the button.
  /// The [alignment] parameter specifies the alignment of the button within its parent widget.
  /// The [buttonTextStyle] parameter specifies the text style of the button text.
  /// The [isDisabled] parameter specifies whether the button is disabled or not.
  /// The [height] parameter specifies the height of the button.
  /// The [width] parameter specifies the width of the button.
  CustomElevatedButton({
    Key? key,
    this.decoration,
    this.leftIcon,
    this.rightIcon,
    EdgeInsets? margin,
    VoidCallback? onPressed,
    ButtonStyle? buttonStyle,
    Alignment? alignment,
    TextStyle? buttonTextStyle,
    bool? isDisabled,
    double? height,
    double? width,
    required String text,
  }) : super(
          text: text,
          onPressed: onPressed,
          buttonStyle: buttonStyle,
          isDisabled: isDisabled,
          buttonTextStyle: buttonTextStyle,
          height: height,
          width: width,
          alignment: alignment,
          margin: margin,
        );

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: buildElevatedButtonWidget,
          )
        : buildElevatedButtonWidget;
  }

  /// Builds the elevated button widget.
  Widget get buildElevatedButtonWidget => Container(
        height: this.height ?? 40.v,
        width: this.width ?? double.maxFinite,
        margin: margin,
        decoration: decoration,
        child: ElevatedButton(
          style: buttonStyle,
          onPressed: isDisabled ?? false ? null : onPressed ?? () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              leftIcon ?? const SizedBox.shrink(),
              Text(
                text,
                style: buttonTextStyle ?? CustomTextStyles.titleSmallOnPrimary,
              ),
              rightIcon ?? const SizedBox.shrink(),
            ],
          ),
        ),
      );
}
