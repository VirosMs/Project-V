// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'favorite_item_model.dart';

/// This class defines the variables used in the [favorite_page],
/// and is typically used to hold data that is passed between different parts of the application.
class FavoriteModel extends Equatable {
  FavoriteModel({this.favoriteItemList = const []}) {}

  List<FavoriteItemModel> favoriteItemList;

  FavoriteModel copyWith({List<FavoriteItemModel>? favoriteItemList}) {
    return FavoriteModel(
      favoriteItemList: favoriteItemList ?? this.favoriteItemList,
    );
  }

  @override
  List<Object?> get props => [favoriteItemList];
}
