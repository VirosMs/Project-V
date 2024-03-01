// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import '../core/app_export.dart';

/// A custom checkbox button widget.
class CustomCheckboxButton extends StatelessWidget {
  CustomCheckboxButton({
    Key? key,
    required this.onChange,
    this.decoration,
    this.alignment,
    this.isRightCheck,
    this.iconSize,
    this.value = false,
    this.text,
    this.width,
    this.padding,
    this.textStyle,
    this.textAlignment,
    this.isExpandedText = false,
  }) : super(
          key: key,
        );

  /// The decoration to be applied to the checkbox button.
  final BoxDecoration? decoration;

  /// The alignment of the checkbox button.
  final Alignment? alignment;

  /// Whether the checkbox should be displayed on the right side.
  final bool? isRightCheck;

  /// The size of the checkbox icon.
  final double? iconSize;

  /// The current value of the checkbox.
  bool? value;

  /// A callback function that is called when the checkbox value changes.
  final Function(bool) onChange;

  /// The text to be displayed next to the checkbox.
  final String? text;

  /// The width of the checkbox button.
  final double? width;

  /// The padding around the checkbox button.
  final EdgeInsetsGeometry? padding;

  /// The style of the text.
  final TextStyle? textStyle;

  /// The alignment of the text.
  final TextAlign? textAlignment;

  /// Whether the text should expand to fill the available space.
  final bool isExpandedText;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: buildCheckBoxWidget,
          )
        : buildCheckBoxWidget;
  }

  /// Builds the checkbox widget.
  Widget get buildCheckBoxWidget => InkWell(
        onTap: () {
          value = !(value!);
          onChange(value!);
        },
        child: Container(
          decoration: decoration,
          width: width,
          child: (isRightCheck ?? false) ? rightSideCheckbox : leftSideCheckbox,
        ),
      );

  /// Builds the checkbox widget with the text on the left side.
  Widget get leftSideCheckbox => Row(
        children: [
          Padding(
            child: checkboxWidget,
            padding: EdgeInsets.only(right: 8),
          ),
          isExpandedText ? Expanded(child: textWidget) : textWidget,
        ],
      );

  /// Builds the checkbox widget with the text on the right side.
  Widget get rightSideCheckbox => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          isExpandedText ? Expanded(child: textWidget) : textWidget,
          Padding(
            padding: EdgeInsets.only(left: 8),
            child: checkboxWidget,
          ),
        ],
      );

  /// Builds the text widget.
  Widget get textWidget => Text(
        text ?? "",
        textAlign: textAlignment ?? TextAlign.center,
        style: textStyle ?? theme.textTheme.titleSmall,
      );

  /// Builds the checkbox widget.
  Widget get checkboxWidget => SizedBox(
        height: iconSize ?? 18.h,
        width: iconSize ?? 18.h,
        child: Checkbox(
          visualDensity: VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          value: value ?? false,
          checkColor: theme.colorScheme.primary,
          onChanged: (value) {
            onChange(value!);
          },
        ),
      );
}
