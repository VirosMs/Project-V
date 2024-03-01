// ignore_for_file: must_be_immutable

part of 'favorite_bloc.dart';

/// Represents the state of Favorite in the application.
class FavoriteState extends Equatable {
  /// The favorite model object.
  final FavoriteModel? favoriteModelObj;

  /// Creates a new instance of [FavoriteState].
  ///
  /// [favoriteModelObj] is an optional parameter representing the favorite model object.
  FavoriteState({this.favoriteModelObj});

  @override
  List<Object?> get props => [
        favoriteModelObj,
      ];

  /// Creates a copy of the current [FavoriteState] with the provided parameters.
  ///
  /// If [favoriteModelObj] is not provided, it defaults to the current [favoriteModelObj].
  FavoriteState copyWith({FavoriteModel? favoriteModelObj}) {
    return FavoriteState(
      favoriteModelObj: favoriteModelObj ?? this.favoriteModelObj,
    );
  }
}
