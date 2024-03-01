// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'favorite_item_model.dart';

/// This class defines the variables used in the [favorite_page],
/// and is typically used to hold data that is passed between different parts of the application.
class FavoriteModel extends Equatable {
  /// The list of favorite items.
  List<FavoriteItemModel> favoriteItemList;

  /// Constructs a new [FavoriteModel] instance.
  ///
  /// The [favoriteItemList] parameter is optional and defaults to an empty list.
  FavoriteModel({this.favoriteItemList = const []});

  /// Creates a new [FavoriteModel] instance with the specified changes.
  ///
  /// If [favoriteItemList] is provided, it replaces the existing [favoriteItemList].
  /// Otherwise, the existing [favoriteItemList] is used.
  FavoriteModel copyWith({List<FavoriteItemModel>? favoriteItemList}) {
    return FavoriteModel(
      favoriteItemList: favoriteItemList ?? this.favoriteItemList,
    );
  }

  @override
  List<Object?> get props => [favoriteItemList];
}
