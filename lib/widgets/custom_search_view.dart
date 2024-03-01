import 'package:flutter/material.dart';
import '../core/app_export.dart';

/// A custom search view widget that provides a text input field with search functionality.
class CustomSearchView extends StatelessWidget {
  CustomSearchView({
    Key? key,
    this.alignment,
    this.width,
    this.scrollPadding,
    this.controller,
    this.focusNode,
    this.autofocus = false,
    this.textStyle,
    this.textInputType = TextInputType.text,
    this.maxLines,
    this.hintText,
    this.hintStyle,
    this.prefix,
    this.prefixConstraints,
    this.suffix,
    this.suffixConstraints,
    this.contentPadding,
    this.borderDecoration,
    this.fillColor,
    this.filled = true,
    this.validator,
    this.onChanged,
  }) : super(
          key: key,
        );

  /// The alignment of the search view widget.
  final Alignment? alignment;

  /// The width of the search view widget.
  final double? width;

  /// The scroll padding of the search view widget.
  final TextEditingController? scrollPadding;

  /// The controller for the text field.
  final TextEditingController? controller;

  /// The focus node for the text field.
  final FocusNode? focusNode;

  /// Whether the text field should be autofocused.
  final bool? autofocus;

  /// The style of the text in the text field.
  final TextStyle? textStyle;

  /// The type of keyboard to use for the text field.
  final TextInputType? textInputType;

  /// The maximum number of lines for the text field.
  final int? maxLines;

  /// The hint text to display in the text field.
  final String? hintText;

  /// The style of the hint text in the text field.
  final TextStyle? hintStyle;

  /// The widget to display before the text field.
  final Widget? prefix;

  /// The constraints for the prefix widget.
  final BoxConstraints? prefixConstraints;

  /// The widget to display after the text field.
  final Widget? suffix;

  /// The constraints for the suffix widget.
  final BoxConstraints? suffixConstraints;

  /// The padding around the content of the text field.
  final EdgeInsets? contentPadding;

  /// The decoration for the text field.
  final InputBorder? borderDecoration;

  /// The fill color of the text field.
  final Color? fillColor;

  /// Whether the text field should be filled with color.
  final bool? filled;

  /// The validator function for the text field.
  final FormFieldValidator<String>? validator;

  /// The callback function that is called when the text field's value changes.
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: searchViewWidget(context),
          )
        : searchViewWidget(context);
  }

  /// Builds the search view widget.
  Widget searchViewWidget(BuildContext context) => SizedBox(
        width: width ?? SizeUtils.width / 1.1,        
        child: TextFormField(
          scrollPadding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          controller: controller,
          focusNode: focusNode ?? FocusNode(),
          autofocus: autofocus!,
          style: textStyle ?? CustomTextStyles.bodyLargeOnPrimaryContainer,
          keyboardType: textInputType,
          maxLines: maxLines ?? 1,
          decoration: decoration,
          validator: validator,
          onChanged: (String value) {
            onChanged!.call(value);
          },
        ),
      );

  /// Returns the decoration for the text field.
  InputDecoration get decoration => InputDecoration(
        hintText: hintText ?? "",
        hintStyle: hintStyle ?? CustomTextStyles.bodyLargeOnPrimaryContainer,
        prefixIcon: prefix ??
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 16.h,
                vertical: 8.v,
              ),
              child: CustomImageView(
                imagePath: ImageConstant.imgMegaphone,
                height: 24.adaptSize,
                width: 24.adaptSize,
                color: appTheme.black900,
              ),
            ),
        prefixIconConstraints: prefixConstraints ??
            BoxConstraints(
              maxHeight: 40.v,
            ),
        suffixIcon: suffix ??
            Container(
              margin: EdgeInsets.fromLTRB(30.h, 8.v, 16.h, 8.v),
              child: CustomImageView(
                imagePath: ImageConstant.imgSearch,
                height: 24.adaptSize,
                width: 24.adaptSize,
                color: appTheme.black900
              ),
            ),
        suffixIconConstraints: suffixConstraints ??
            BoxConstraints(
              maxHeight: 40.v,
            ),
        isDense: true,
        contentPadding: contentPadding ?? EdgeInsets.symmetric(vertical: 10.v),
        fillColor: fillColor ?? appTheme.gray300,
        filled: filled,
        border: borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.h),
              borderSide: BorderSide.none,
            ),
        enabledBorder: borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.h),
              borderSide: BorderSide.none,
            ),
        focusedBorder: borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.h),
              borderSide: BorderSide.none,
            ),
      );
}
