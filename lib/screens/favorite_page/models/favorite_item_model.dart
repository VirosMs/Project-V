import '../../../core/app_export.dart';

/// This class represents a favorite item in the [favorite_item_widget] screen.
class FavoriteItemModel {
  /// The header of the favorite item.
  String? header;

  /// The subhead of the favorite item.
  String? subhead;

  /// The image URL of the favorite item.
  String? onepiece;

  /// The ID of the favorite item.
  String? id;

  /// Constructs a new [FavoriteItemModel] instance.
  ///
  /// The [header] parameter represents the header of the favorite item.
  /// The [subhead] parameter represents the subhead of the favorite item.
  /// The [onepiece] parameter represents the image URL of the favorite item.
  /// The [id] parameter represents the ID of the favorite item.
  FavoriteItemModel({
    this.header,
    this.subhead,
    this.onepiece,
    this.id,
  }) {
    header = header ?? "One piece";
    subhead = subhead ?? "Subhead";
    onepiece = onepiece ?? ImageConstant.imgMedia;
    id = id ?? "";
  }
}
