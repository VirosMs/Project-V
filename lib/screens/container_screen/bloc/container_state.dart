// ignore_for_file: must_be_immutable

part of 'container_bloc.dart';

/// Represents the state of HomeContainer in the application.
class ContainerState extends Equatable {
  ContainerState({this.homeContainerModelObj});

  HomeContainerModel? homeContainerModelObj;

  @override
  List<Object?> get props => [
        homeContainerModelObj,
      ];

  ContainerState copyWith({HomeContainerModel? homeContainerModelObj}) {
    return ContainerState(
      homeContainerModelObj:
          homeContainerModelObj ?? this.homeContainerModelObj,
    );
  }
}
