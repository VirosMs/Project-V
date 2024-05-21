import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:project_v/data/apiClient/api_client.dart';
import 'package:project_v/entity/user.dart';
import 'package:project_v/entity/userDTO.dart';
import '/core/app_export.dart';
import 'package:project_v/screens/login_screen/models/login_model.dart';
import 'package:logger/logger.dart' as logger_package;
part 'login_event.dart';
part 'login_state.dart';

logger_package.Logger logger = logger_package.Logger();

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

  Future<UserDTO> login(String email, String password) async {
    // Perform login operation here
    logger.i('Login initiated');

    if (email.isEmpty || password.isEmpty) {
      throw Exception('err_msg_email_password_empty'.tr);
    }
    logger.i('Login user: $email');

    ApiClient apiClient = ApiClient();

    try {
      var user = await apiClient.getUser(email, password);
      logger.i('Login successful');
      return user;
    } catch (e) {
      logger.e('Login failed: $e');
      throw Exception('err_msg_user_not_found'.tr);
    }
  }
}
