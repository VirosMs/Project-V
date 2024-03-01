// ignore_for_file: must_be_immutable

part of 'home_bloc.dart';

/// Represents the state of Home in the application.
class HomeState extends Equatable {
  /// The controller for the search field in the home page.
  TextEditingController? searchController;

  /// The model object representing the home data.
  HomeModel? homeModelObj;

  /// Creates a new instance of [HomeState].
  ///
  /// [searchController] is the controller for the search field.
  /// [homeModelObj] is the model object representing the home data.
  HomeState({
    this.searchController,
    this.homeModelObj,
  });

  @override
  List<Object?> get props => [
        searchController,
        homeModelObj,
      ];

  /// Creates a copy of the current [HomeState] with the given parameters overridden.
  ///
  /// [searchController] (optional) is the new search controller to be used.
  /// [homeModelObj] (optional) is the new home model object to be used.
  HomeState copyWith({
    TextEditingController? searchController,
    HomeModel? homeModelObj,
  }) {
    return HomeState(
      searchController: searchController ?? this.searchController,
      homeModelObj: homeModelObj ?? this.homeModelObj,
    );
  }
}
