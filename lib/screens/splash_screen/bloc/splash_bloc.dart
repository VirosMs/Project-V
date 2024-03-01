import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:project_v/screens/splash_screen/models/splash_model.dart';
part 'splash_event.dart';
part 'splash_state.dart';

/// A bloc that manages the state of a Splash according to the event that is dispatched to it.
class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc(SplashState initialState) : super(initialState) {
    on<SplashInitialEvent>(_onInitialize);
  }

  /// Handles the [SplashInitialEvent] by delaying for 1500 milliseconds and then navigating to the login screen.
  _onInitialize(
    SplashInitialEvent event,
    Emitter<SplashState> emit,
  ) async {
    Future.delayed(const Duration(milliseconds: 1500), () {
      NavigatorService.popAndPushNamed(
        AppRoutes.loginScreen,
      );
    });
  }
}
