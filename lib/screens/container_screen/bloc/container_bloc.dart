import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:project_v/screens/container_screen/models/home_container_model.dart';
part 'container_event.dart';
part 'container_state.dart';

/// A bloc that manages the state of a HomeContainer according to the event that is dispatched to it.
class ContainerBloc extends Bloc<ContainerEvent, ContainerState> {
  ContainerBloc(ContainerState initialState) : super(initialState) {
    on<ContainerInitialEvent>(_onInitialize);
  }

  /// Handles the [ContainerInitialEvent] and initializes the [ContainerState].
  ///
  /// This method is called when a [ContainerInitialEvent] is dispatched to the bloc.
  /// It initializes the [ContainerState] based on the event and emits the updated state.
  _onInitialize(
    ContainerInitialEvent event,
    Emitter<ContainerState> emit,
  ) async {}
}
