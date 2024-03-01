import 'package:flutter/material.dart';
import 'package:project_v/core/app_export.dart';

/// A custom app bar widget that can be used in a Flutter application.
/// It extends the [StatelessWidget] class and implements the [PreferredSizeWidget] interface.
/// The [CustomAppBar] widget provides a customizable app bar with various properties such as height, leading width, leading widget, title widget, center title, and actions.
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// Creates a [CustomAppBar] widget.
  ///
  /// The [key] parameter is used to provide a unique identifier for the widget.
  /// The [height] parameter specifies the height of the app bar.
  /// The [leadingWidth] parameter specifies the width of the leading widget.
  /// The [leading] parameter specifies the widget to be displayed as the leading widget.
  /// The [title] parameter specifies the widget to be displayed as the title.
  /// The [centerTitle] parameter specifies whether the title should be centered.
  /// The [actions] parameter specifies a list of widgets to be displayed as actions.
  CustomAppBar({
    Key? key,
    this.height,
    this.leadingWidth,
    this.leading,
    this.title,
    this.centerTitle,
    this.actions,
  }) : super(
          key: key,
        );

  /// The height of the app bar.
  final double? height;

  /// The width of the leading widget.
  final double? leadingWidth;

  /// The widget to be displayed as the leading widget.
  final Widget? leading;

  /// The widget to be displayed as the title.
  final Widget? title;

  /// Whether the title should be centered.
  final bool? centerTitle;

  /// A list of widgets to be displayed as actions.
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      toolbarHeight: height ?? 40.v,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      leadingWidth: leadingWidth ?? 0,
      leading: leading,
      title: title,
      titleSpacing: 0,
      centerTitle: centerTitle ?? false,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size(
        SizeUtils.width,
        height ?? 40.v,
      );
}
