/// FILEPATH: /D:/Git/project_v/lib/screens/home_page/home_page.dart
/// 
/// This file contains the implementation of the [HomePage] class, which represents the home page of the application.
/// 
/// The [HomePage] class extends [StatelessWidget] and is responsible for building the user interface of the home page.
/// It includes methods for constructing carousels of images and individual carousel items.
/// 
/// Example usage:
/// ```dart
/// HomePage.builder(context);
/// ```
import 'package:project_v/widgets/custom_search_view.dart';
import 'models/home_model.dart';
import 'package:flutter/material.dart';
import 'package:project_v/core/app_export.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'bloc/home_bloc.dart';

/// HomePage is a class that extends [StatelessWidget] and represents the home page of the application.
class HomePage extends StatelessWidget {
  /// Constructor for [HomePage].
  const HomePage({Key? key})
      : super(
          key: key,
        );

  /// Static method to build the [HomePage] with its respective [BlocProvider].
  static Widget builder(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (context) => HomeBloc(HomeState(
        homeModelObj: HomeModel(),
      ))
        ..add(HomeInitialEvent()),
      child: HomePage(),
    );
  }

  /// Method that builds the user interface of the [HomePage].
  @override
  Widget build(BuildContext context) {
    // Here, the user interface of the [HomePage] is constructed.
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Container(
            width: double.maxFinite,
            decoration: AppDecoration.fillOnPrimary,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 9.v),
                  BlocSelector<HomeBloc, HomeState, TextEditingController?>(
                    selector: (state) => state.searchController,
                    builder: (context, searchController) {
                      return CustomSearchView(
                        controller: searchController,
                        hintText: "msg_hinted_search_text".tr,
                      );
                    },
                  ),
                  SizedBox(height: 26.v),
                  _buildCarousel(context),
                  SizedBox(height: 29.v),
                  _buildCarousel1(context),
                  SizedBox(height: 28.v),
                  _buildCarousel2(context),
                ],
              ),
            ),
          )),
    );
  }

  /// Section Widget
  /// Method to build a carousel of images.
  Widget _buildCarousel(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 198.v,
        viewportFraction: 0.4,
      ),
      items: [
        _buildItem1(context,
            imagePath: ImageConstant.imgItem1199x128, text: "lbl_bleach".tr),
        _buildItem1(context,
            imagePath: ImageConstant.imgItem2198x128,
            text: "lbl_demon_slayer".tr),
        _buildItem1(context,
            imagePath: ImageConstant.imgItem2198x128,
            text: "lbl_boku_no_hero".tr)
      ],
    );
  }

  /// Section Widget
  /// Method to build a second carousel of images.
  Widget _buildCarousel1(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 198.v,
        viewportFraction: 0.4,
      ),
      items: [
        _buildItem1(context,
            imagePath: ImageConstant.imgItem1199x128, text: "lbl_bleach".tr),
        _buildItem1(context,
            imagePath: ImageConstant.imgItem2198x128,
            text: "lbl_demon_slayer".tr),
        _buildItem1(context,
            imagePath: ImageConstant.imgItem2198x128,
            text: "lbl_boku_no_hero".tr)
      ],
    );
  }

  /// Section Widget
  /// Method to build a third carousel of images.
  Widget _buildCarousel2(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 198.v,
        viewportFraction: 0.4,
      ),
      items: [
        _buildItem1(context,
            imagePath: ImageConstant.imgItem1199x128, text: "lbl_bleach".tr),
        _buildItem1(context,
            imagePath: ImageConstant.imgItem2198x128,
            text: "lbl_demon_slayer".tr),
        _buildItem1(context,
            imagePath: ImageConstant.imgItem2198x128,
            text: "lbl_boku_no_hero".tr)
      ],
    );
  }

  /// Method to build an individual item of the carousel.
  Widget _buildItem1(
    BuildContext context, {
    required String imagePath,
    required String text,
  }) {
    // Here, an individual item of the carousel is constructed.
    return Stack(
      children: [
        CustomImageView(
          imagePath: imagePath,
          height: 198.v,
          width: 128.h,
          radius: BorderRadius.circular(28.h),
        ),
        Container(
          width: 128.h,
          padding: EdgeInsets.symmetric(
            horizontal: 16.h,
            vertical: 17.v,
          ),
          decoration: AppDecoration.gradientOnPrimaryToBlack.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder28,
          ),
        ),
        Positioned(
          bottom: 16.h,
          left: 14.h,
          child: Text(
            text,
            style: CustomTextStyles.titleMediumOnPrimary.copyWith(
              color: theme.colorScheme.onPrimary,
            ),
          ),
        ),
      ],
    );
  }
}
