import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:project_v/data/apiClient/api_client.dart';
import 'package:project_v/entity/user.dart';
import '/core/app_export.dart';
import 'package:project_v/screens/register_screen/models/register_model.dart';
import 'package:logger/logger.dart' as logger_package;
part 'register_event.dart';
part 'register_state.dart';

logger_package.Logger logger = logger_package.Logger();

/// A bloc that manages the state of a Register according to the event that is dispatched to it.
class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc(RegisterState initialState) : super(initialState) {
    on<RegisterInitialEvent>(_onInitialize);
    on<ChangePasswordVisibilityEvent>(_changePasswordVisibility);
    on<ChangePasswordVisibilityEvent1>(_changePasswordVisibility1);
    on<ChangeCheckBoxEvent>(_changeCheckBox);
  }

  /// Changes the visibility of the password.
  _changePasswordVisibility(
    ChangePasswordVisibilityEvent event,
    Emitter<RegisterState> emit,
  ) {
    emit(state.copyWith(
      isShowPassword: event.value,
    ));
  }

  /// Changes the visibility of the second password.
  _changePasswordVisibility1(
    ChangePasswordVisibilityEvent1 event,
    Emitter<RegisterState> emit,
  ) {
    emit(state.copyWith(
      isShowPassword1: event.value,
    ));
  }

  /// Changes the value of the checkbox.
  _changeCheckBox(
    ChangeCheckBoxEvent event,
    Emitter<RegisterState> emit,
  ) {
    emit(state.copyWith(
      container: event.value,
    ));
  }

  /// Initializes the Register state with default values.
  _onInitialize(
    RegisterInitialEvent event,
    Emitter<RegisterState> emit,
  ) async {
    emit(state.copyWith(
      nameController: TextEditingController(),
      emailController: TextEditingController(),
      passwordController: TextEditingController(),
      passwordController1: TextEditingController(),
      isShowPassword: true,
      isShowPassword1: true,
      container: false,
    ));
  }

  Future registerUser() async {
    logger.i('Register user: $state.nameController!.text');
    User user = User(
      name: state.nameController!.text,
      email: state.emailController!.text,
      password: state.passwordController!.text,
    );

    ApiClient apiClient = ApiClient();

    await apiClient.createUser(user).catchError((e) {
      logger.e('Error: $e');
      throw e;
    }).then((value) {
      logger.i('User created');
      return true;
    });
  }
}
