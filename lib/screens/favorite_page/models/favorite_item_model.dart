import '../../../core/app_export.dart';

/// This class is used in the [favorite_item_widget] screen.
class FavoriteItemModel {
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

  String? header;

  String? subhead;

  String? onepiece;

  String? id;
}
