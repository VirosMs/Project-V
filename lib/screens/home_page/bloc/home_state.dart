// ignore_for_file: must_be_immutable

part of 'home_bloc.dart';

/// Represents the state of Home in the application.
class HomeState extends Equatable {
  HomeState({
    this.searchController,
    this.homeModelObj,
  });

  TextEditingController? searchController;

  HomeModel? homeModelObj;

  @override
  List<Object?> get props => [
        searchController,
        homeModelObj,
      ];

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
