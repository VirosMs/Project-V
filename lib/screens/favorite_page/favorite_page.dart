import 'package:project_v/widgets/app_bar/custom_app_bar.dart';
import 'widgets/favorite_item_widget.dart';
import 'models/favorite_item_model.dart';
import 'models/favorite_model.dart';
import 'package:flutter/material.dart';
import 'package:project_v/core/app_export.dart';
import 'bloc/favorite_bloc.dart';

// ignore_for_file: must_be_immutable
class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<FavoriteBloc>(
      create: (context) => FavoriteBloc(FavoriteState(
        favoriteModelObj: FavoriteModel(),
      ))
        ..add(FavoriteInitialEvent()),
      child: FavoritePage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          decoration: AppDecoration.fillOnPrimary,
          child: Column(
            children: [
              SizedBox(height: 5.v),
              _buildTopAppBar(context),
              SizedBox(height: 11.v),
              _buildFavorite(context),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildTopAppBar(BuildContext context) {
    return SizedBox(
      height: 48.v,
      width: double.maxFinite,
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          CustomAppBar(),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(
                left: 4.h,
                right: 50.h,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgArrowDown,
                    height: 48.adaptSize,
                    width: 48.adaptSize,
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 4.v),
                    child: Text(
                      "lbl_lector_verso".tr,
                      style: theme.textTheme.displaySmall,
                    ),
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
  Widget _buildFavorite(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.h),
        child: BlocSelector<FavoriteBloc, FavoriteState, FavoriteModel?>(
          selector: (state) => state.favoriteModelObj,
          builder: (context, favoriteModelObj) {
            return ListView.separated(
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              separatorBuilder: (
                context,
                index,
              ) {
                return SizedBox(
                  height: 20.v,
                );
              },
              itemCount: favoriteModelObj?.favoriteItemList.length ?? 0,
              itemBuilder: (context, index) {
                FavoriteItemModel model =
                    favoriteModelObj?.favoriteItemList[index] ??
                        FavoriteItemModel();
                return FavoriteItemWidget(
                  model,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
