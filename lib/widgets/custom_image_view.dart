// ignore_for_file: must_be_immutable

import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// A custom image view widget that can be used to display different types of images.
/// It provides options for customizing the image's height, width, color, alignment, and more.
class CustomImageView extends StatelessWidget {
  /// The path of the image to be displayed.
  String? imagePath;

  /// The height of the image.
  double? height;

  /// The width of the image.
  double? width;

  /// The color of the image.
  Color? color;

  /// The fit of the image within its container.
  BoxFit? fit;

  /// The placeholder image to be displayed if the image is not found.
  final String placeHolder;

  /// The alignment of the image within its container.
  Alignment? alignment;

  /// The callback function to be called when the image is tapped.
  VoidCallback? onTap;

  /// The margin around the image.
  EdgeInsetsGeometry? margin;

  /// The border radius of the image.
  BorderRadius? radius;

  /// The border of the image.
  BoxBorder? border;

  /// Creates a new [CustomImageView] widget.
  ///
  /// The [imagePath] parameter is required and specifies the path of the image to be displayed.
  /// The [placeHolder] parameter specifies the placeholder image to be displayed if the image is not found.
  /// The other parameters are optional and can be used to customize the appearance of the image.
  CustomImageView({
    this.imagePath,
    this.height,
    this.width,
    this.color,
    this.fit,
    this.alignment,
    this.onTap,
    this.radius,
    this.margin,
    this.border,
    this.placeHolder = 'assets/images/image_not_found.png',
  });

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment!,
            child: _buildWidget(),
          )
        : _buildWidget();
  }

  Widget _buildWidget() {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: InkWell(
        onTap: onTap,
        child: _buildCircleImage(),
      ),
    );
  }

  /// Builds the image with border radius.
  _buildCircleImage() {
    if (radius != null) {
      return ClipRRect(
        borderRadius: radius ?? BorderRadius.zero,
        child: _buildImageWithBorder(),
      );
    } else {
      return _buildImageWithBorder();
    }
  }

  /// Builds the image with border and border radius style.
  _buildImageWithBorder() {
    if (border != null) {
      return Container(
        decoration: BoxDecoration(
          border: border,
          borderRadius: radius,
        ),
        child: _buildImageView(),
      );
    } else {
      return _buildImageView();
    }
  }

  /// Builds the image view based on the image type.
  Widget _buildImageView() {
    if (imagePath != null) {
      switch (imagePath!.imageType) {
        case ImageType.svg:
          return Container(
            height: height,
            width: width,
            child: SvgPicture.asset(
              imagePath!,
              height: height,
              width: width,
              fit: fit ?? BoxFit.contain,
              colorFilter: ColorFilter.mode(
                  this.color ?? Colors.transparent, BlendMode.srcIn),
            ),
          );
        case ImageType.file:
          return Image.file(
            File(imagePath!),
            height: height,
            width: width,
            fit: fit ?? BoxFit.cover,
            color: color,
          );
        case ImageType.network:
          return CachedNetworkImage(
            height: height,
            width: width,
            fit: fit,
            imageUrl: imagePath!,
            color: color,
            placeholder: (context, url) => Container(
              height: 30,
              width: 30,
              child: LinearProgressIndicator(
                color: Colors.grey.shade200,
                backgroundColor: Colors.grey.shade100,
              ),
            ),
            errorWidget: (context, url, error) => Image.asset(
              placeHolder,
              height: height,
              width: width,
              fit: fit ?? BoxFit.cover,
            ),
          );
        case ImageType.png:
        default:
          return Image.asset(
            imagePath!,
            height: height,
            width: width,
            fit: fit ?? BoxFit.cover,
            color: color,
          );
      }
    }
    return SizedBox();
  }
}

/// Extension on the [String] class to determine the type of the image.
extension ImageTypeExtension on String {
  /// Returns the type of the image based on its path.
  ImageType get imageType {
    if (this.startsWith('http') || this.startsWith('https')) {
      return ImageType.network;
    } else if (this.endsWith('.svg')) {
      return ImageType.svg;
    } else if (this.startsWith('file://')) {
      return ImageType.file;
    } else {
      return ImageType.png;
    }
  }
}

/// Enum representing the different types of images.
enum ImageType { svg, png, network, file, unknown }
