import 'package:project_v/widgets/app_bar/custom_app_bar.dart';
import 'widgets/favorite_item_widget.dart';
import 'models/favorite_item_model.dart';
import 'models/favorite_model.dart';
import 'package:flutter/material.dart';
import 'package:project_v/core/app_export.dart';
import 'bloc/favorite_bloc.dart';

/// The FavoritePage class represents a screen that displays a list of favorite items.
class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key})
      : super(
          key: key,
        );

  /// Creates a FavoritePage widget using the provided [context].
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
      body: SingleChildScrollView(
        child: Container(
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
    ));
  }

  /// Builds the top app bar widget.
  ///
  /// The top app bar contains a custom app bar and a text label.
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
                left: 55.h,
                right: 50.h,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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

  /// Builds the favorite list widget.
  ///
  /// The favorite list is populated with items from the [favoriteModelObj].
  Widget _buildFavorite(BuildContext context) {
    return Padding(
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
    );
  }
}
