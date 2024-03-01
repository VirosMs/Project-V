import 'package:flutter/material.dart';
import '../core/app_export.dart';

/// A custom text field widget with floating label and customizable decoration.
class CustomFloatingTextField extends StatelessWidget {
  CustomFloatingTextField({
    Key? key,
    this.alignment,
    this.width,
    this.scrollPadding,
    this.controller,
    this.autofocus = false,
    this.textStyle,
    this.obscureText = false,
    this.textInputAction = TextInputAction.next,
    this.textInputType = TextInputType.text,
    this.maxLines,
    this.hintText,
    this.hintStyle,
    this.labelText,
    this.labelStyle,
    this.prefix,
    this.prefixConstraints,
    this.suffix,
    this.suffixConstraints,
    this.contentPadding,
    this.borderDecoration,
    this.fillColor,
    this.filled = false,
    this.validator,
  }) : super(
          key: key,
        );

  /// The alignment of the text field within its parent widget.
  final Alignment? alignment;

  /// The width of the text field.
  final double? width;

  /// The scroll padding for the text field.
  final TextEditingController? scrollPadding;

  /// The controller for the text field.
  final TextEditingController? controller;

  /// Whether the text field should be autofocused.
  final bool? autofocus;

  /// The style of the text in the text field.
  final TextStyle? textStyle;

  /// Whether the text in the text field should be obscured.
  final bool? obscureText;

  /// The action to take when the user submits the text field.
  final TextInputAction? textInputAction;

  /// The type of keyboard to display for the text field.
  final TextInputType? textInputType;

  /// The maximum number of lines for the text field.
  final int? maxLines;

  /// The hint text to display when the text field is empty.
  final String? hintText;

  /// The style of the hint text.
  final TextStyle? hintStyle;

  /// The label text to display above the text field.
  final String? labelText;

  /// The style of the label text.
  final TextStyle? labelStyle;

  /// The widget to display as a prefix to the text field.
  final Widget? prefix;

  /// The constraints for the prefix widget.
  final BoxConstraints? prefixConstraints;

  /// The widget to display as a suffix to the text field.
  final Widget? suffix;

  /// The constraints for the suffix widget.
  final BoxConstraints? suffixConstraints;

  /// The padding for the content of the text field.
  final EdgeInsets? contentPadding;

  /// The decoration for the text field border.
  final InputBorder? borderDecoration;

  /// The fill color for the text field.
  final Color? fillColor;

  /// Whether the text field should be filled with color.
  final bool? filled;

  /// The validator function for the text field.
  final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: floatingTextFieldWidget(context),
          )
        : floatingTextFieldWidget(context);
  }

  Widget floatingTextFieldWidget(BuildContext context) => SizedBox(
        width: width ?? double.maxFinite,
        child: TextFormField(
          scrollPadding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          controller: controller,
          style: textStyle ?? theme.textTheme.bodyLarge,
          obscureText: obscureText!,
          // textInputAction: textInputAction,
          keyboardType: textInputType,
          maxLines: maxLines ?? 1,
          decoration: decoration,
          validator: validator,
        ),
      );

  InputDecoration get decoration => InputDecoration(
        hintText: hintText ?? "",
        hintStyle: hintStyle ?? theme.textTheme.bodyLarge,
        labelText: labelText ?? "",
        labelStyle: labelStyle,
        prefixIcon: prefix,
        prefixIconConstraints: prefixConstraints,
        suffixIcon: suffix,
        suffixIconConstraints: suffixConstraints,
        isDense: true,
        contentPadding:
            contentPadding ?? EdgeInsets.fromLTRB(16.h, 17.v, 16.h, 19.v),
        fillColor: fillColor,
        filled: filled,
        border: borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(4.h),
              borderSide: BorderSide(
                color: appTheme.gray600,
                width: 1,
              ),
            ),
        enabledBorder: borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(4.h),
              borderSide: BorderSide(
                color: appTheme.gray600,
                width: 1,
              ),
            ),
        focusedBorder: borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(4.h),
              borderSide: BorderSide(
                color: appTheme.gray600,
                width: 1,
              ),
            ),
      );
}
