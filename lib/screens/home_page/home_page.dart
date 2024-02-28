import 'package:project_v/widgets/custom_search_view.dart';
import 'models/home_model.dart';
import 'package:flutter/material.dart';
import 'package:project_v/core/app_export.dart';
import 'bloc/home_bloc.dart';

// ignore_for_file: must_be_immutable
class HomePage extends StatelessWidget {
  const HomePage({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (context) => HomeBloc(HomeState(
        homeModelObj: HomeModel(),
      ))
        ..add(HomeInitialEvent()),
      child: HomePage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          width: double.maxFinite,
          decoration: AppDecoration.fillOnPrimary,
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
      ),
    );
  }

  /// Section Widget
  Widget _buildCarousel(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildItem1(
            context,
            label: "lbl_bleach".tr,
          ),
          Container(
            margin: EdgeInsets.only(left: 8.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadiusStyle.roundedBorder28,
              image: DecorationImage(
                image: AssetImage(
                  ImageConstant.imgItem2198x128,
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: IntrinsicWidth(
                child: SizedBox(
                  height: 198.v,
                  width: 128.h,
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          height: 198.v,
                          width: 128.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              28.h,
                            ),
                            gradient: LinearGradient(
                              begin: Alignment(0.5, 0),
                              end: Alignment(0.5, 1),
                              colors: [
                                theme.colorScheme.onPrimary.withOpacity(0),
                                appTheme.black900.withOpacity(0.5),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          width: 236.h,
                          margin: EdgeInsets.only(
                            left: 16.h,
                            top: 159.v,
                            bottom: 17.v,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 1.v),
                                child: Text(
                                  "lbl_demon_slayer".tr,
                                  style: CustomTextStyles.titleMediumOnPrimary,
                                ),
                              ),
                              Text(
                                "lbl_boku_no_hero".tr,
                                style: CustomTextStyles.titleMediumOnPrimary,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 198.v,
            width: 72.h,
            margin: EdgeInsets.only(left: 8.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.horizontal(
                left: Radius.circular(28.h),
              ),
              gradient: LinearGradient(
                begin: Alignment(0.5, 0),
                end: Alignment(0.5, 1),
                colors: [
                  theme.colorScheme.onPrimary.withOpacity(0),
                  appTheme.black900.withOpacity(0.5),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildCarousel1(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildItem1(
            context,
            label: "lbl_one_piece".tr,
          ),
          Padding(
            padding: EdgeInsets.only(left: 8.h),
            child: _buildItem1(
              context,
              label: "lbl_magi".tr,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 8.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadiusStyle.customBorderTL28,
              image: DecorationImage(
                image: AssetImage(
                  ImageConstant.imgItemLast199x72,
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              width: 72.h,
              padding: EdgeInsets.symmetric(
                horizontal: 6.h,
                vertical: 19.v,
              ),
              decoration: AppDecoration.gradientOnPrimaryToBlack.copyWith(
                borderRadius: BorderRadiusStyle.customBorderTL28,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(height: 141.v),
                  Text(
                    "lbl_naruto".tr,
                    style: CustomTextStyles.titleMediumOnPrimary,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildCarousel2(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgItem1,
            height: 198.v,
            width: 128.h,
            radius: BorderRadius.circular(
              28.h,
            ),
          ),
          CustomImageView(
            imagePath: ImageConstant.imgItem2,
            height: 198.v,
            width: 128.h,
            radius: BorderRadius.circular(
              28.h,
            ),
            margin: EdgeInsets.only(left: 8.h),
          ),
          CustomImageView(
            imagePath: ImageConstant.imgItemLast,
            height: 198.v,
            width: 72.h,
            radius: BorderRadius.horizontal(
              left: Radius.circular(28.h),
            ),
            margin: EdgeInsets.only(left: 8.h),
          ),
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildItem1(
    BuildContext context, {
    required String label,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadiusStyle.roundedBorder28,
        image: DecorationImage(
          image: AssetImage(
            ImageConstant.imgItem1199x128,
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        width: 128.h,
        padding: EdgeInsets.symmetric(
          horizontal: 16.h,
          vertical: 17.v,
        ),
        decoration: AppDecoration.gradientOnPrimaryToBlack.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder28,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(height: 144.v),
            Text(
              label,
              style: CustomTextStyles.titleMediumOnPrimary.copyWith(
                color: theme.colorScheme.onPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
