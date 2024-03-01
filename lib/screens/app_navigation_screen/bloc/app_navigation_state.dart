part of 'app_navigation_bloc.dart';

/// Represents the state of AppNavigation in the application.
///
/// This class is used to define the state of the AppNavigation feature in the application.
/// It contains a single property `appNavigationModelObj` which represents the current navigation model.
/// The `props` method is overridden to provide a list of properties that should be considered when comparing two instances of this class for equality.
/// The `copyWith` method is provided to create a new instance of `AppNavigationState` with updated values.
class AppNavigationState extends Equatable {
  AppNavigationState({this.appNavigationModelObj});

  final AppNavigationModel? appNavigationModelObj;

  @override
  List<Object?> get props => [
        appNavigationModelObj,
      ];

  AppNavigationState copyWith({AppNavigationModel? appNavigationModelObj}) {
    return AppNavigationState(
      appNavigationModelObj:
          appNavigationModelObj ?? this.appNavigationModelObj,
    );
  }
}
