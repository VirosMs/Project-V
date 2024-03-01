part of 'container_bloc.dart';

/// Represents the state of HomeContainer in the application.
class ContainerState extends Equatable {
  /// Creates a new instance of [ContainerState].
  ///
  /// [homeContainerModelObj] is an optional parameter representing the home container model object.
  ContainerState({this.homeContainerModelObj});

  /// The home container model object.
  final HomeContainerModel? homeContainerModelObj;

  @override
  List<Object?> get props => [
        homeContainerModelObj,
      ];

  /// Creates a copy of the current [ContainerState] instance with the provided parameters.
  ///
  /// If [homeContainerModelObj] is not provided, it defaults to the value of the current instance.
  ContainerState copyWith({HomeContainerModel? homeContainerModelObj}) {
    return ContainerState(
      homeContainerModelObj:
          homeContainerModelObj ?? this.homeContainerModelObj,
    );
  }
}
