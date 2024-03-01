import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:project_v/screens/app_navigation_screen/models/app_navigation_model.dart';

part 'app_navigation_event.dart';
part 'app_navigation_state.dart';

/// A bloc that manages the state of a AppNavigation according to the event that is dispatched to it.
class AppNavigationBloc extends Bloc<AppNavigationEvent, AppNavigationState> {
  AppNavigationBloc(AppNavigationState initialState) : super(initialState) {
    on<AppNavigationInitialEvent>(_onInitialize);
  }

  /// Handles the [AppNavigationInitialEvent] and performs the necessary operations.
  ///
  /// This method is called when the [AppNavigationInitialEvent] is dispatched to the bloc.
  /// It takes the [event] and [emit] as parameters and performs the necessary operations.
  /// It is an asynchronous method.
  _onInitialize(
    AppNavigationInitialEvent event,
    Emitter<AppNavigationState> emit,
  ) async {}
}
