import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:project_v/screens/login_screen/models/login_model.dart';
part 'login_event.dart';
part 'login_state.dart';

/// A bloc that manages the state of a Login according to the event that is dispatched to it.
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(LoginState initialState) : super(initialState) {
    on<LoginInitialEvent>(_onInitialize);
    on<ChangePasswordVisibilityEvent>(_changePasswordVisibility);
  }

  /// Changes the visibility of the password field.
  ///
  /// This method is called when a [ChangePasswordVisibilityEvent] is dispatched to the bloc.
  /// It updates the [LoginState] by changing the value of [isShowPassword] to the value provided in the event.
  _changePasswordVisibility(
    ChangePasswordVisibilityEvent event,
    Emitter<LoginState> emit,
  ) {
    emit(state.copyWith(
      isShowPassword: event.value,
    ));
  }

  /// Initializes the login state.
  ///
  /// This method is called when a [LoginInitialEvent] is dispatched to the bloc.
  /// It initializes the [LoginState] by setting the email and password controllers,
  /// and setting the initial value of [isShowPassword] to true.
  _onInitialize(
    LoginInitialEvent event,
    Emitter<LoginState> emit,
  ) async {
    emit(state.copyWith(
      emailController: TextEditingController(),
      passwordController: TextEditingController(),
      isShowPassword: true,
    ));
  }
}
