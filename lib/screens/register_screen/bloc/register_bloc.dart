import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:project_v/screens/register_screen/models/register_model.dart';
part 'register_event.dart';
part 'register_state.dart';

/// A bloc that manages the state of a Register according to the event that is dispatched to it.
class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc(RegisterState initialState) : super(initialState) {
    on<RegisterInitialEvent>(_onInitialize);
    on<ChangePasswordVisibilityEvent>(_changePasswordVisibility);
    on<ChangePasswordVisibilityEvent1>(_changePasswordVisibility1);
    on<ChangeCheckBoxEvent>(_changeCheckBox);
  }

  _changePasswordVisibility(
    ChangePasswordVisibilityEvent event,
    Emitter<RegisterState> emit,
  ) {
    emit(state.copyWith(
      isShowPassword: event.value,
    ));
  }

  _changePasswordVisibility1(
    ChangePasswordVisibilityEvent1 event,
    Emitter<RegisterState> emit,
  ) {
    emit(state.copyWith(
      isShowPassword1: event.value,
    ));
  }

  _changeCheckBox(
    ChangeCheckBoxEvent event,
    Emitter<RegisterState> emit,
  ) {
    emit(state.copyWith(
      container: event.value,
    ));
  }

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
}
