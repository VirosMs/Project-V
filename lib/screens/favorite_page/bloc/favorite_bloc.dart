import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/favorite_item_model.dart';
import 'package:project_v/screens/favorite_page/models/favorite_model.dart';
part 'favorite_event.dart';
part 'favorite_state.dart';

/// A bloc that manages the state of a Favorite according to the event that is dispatched to it.
class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  FavoriteBloc(FavoriteState initialState) : super(initialState) {
    on<FavoriteInitialEvent>(_onInitialize);
  }

  /// Initializes the Favorite state with a list of favorite items.
  _onInitialize(
    FavoriteInitialEvent event,
    Emitter<FavoriteState> emit,
  ) async {
    emit(state.copyWith(
        favoriteModelObj: state.favoriteModelObj?.copyWith(
      favoriteItemList: fillFavoriteItemList(),
    )));
  }

  /// Fills the favorite item list with predefined items.
  List<FavoriteItemModel> fillFavoriteItemList() {
    return [
      FavoriteItemModel(
          header: "One piece",
          subhead: "Subhead",
          onepiece: ImageConstant.imgMedia),
      FavoriteItemModel(
          header: "Demon Slayer",
          subhead: "Subhead",
          onepiece: ImageConstant.imgMedia78x80),
      FavoriteItemModel(
          header: "Magi",
          subhead: "Subhead",
          onepiece: ImageConstant.imgMedia79x80),
      FavoriteItemModel(
          header: "Hanako-kun",
          subhead: "Subhead",
          onepiece: ImageConstant.imgMedia1),
      FavoriteItemModel(
          header: "Boku No Hero",
          subhead: "Subhead",
          onepiece: ImageConstant.imgMedia2),
      FavoriteItemModel(
          header: "Dragon Ball",
          subhead: "Subhead",
          onepiece: ImageConstant.imgMedia3)
    ];
  }
}
