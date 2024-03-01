// ignore_for_file: must_be_immutable

part of 'register_bloc.dart';

/// Represents the state of Register in the application.
class RegisterState extends Equatable {
  RegisterState({
    this.nameController,
    this.emailController,
    this.passwordController,
    this.passwordController1,
    this.isShowPassword = true,
    this.isShowPassword1 = true,
    this.container = false,
    this.registerModelObj,
  });

  /// The controller for the name input field.
  TextEditingController? nameController;

  /// The controller for the email input field.
  TextEditingController? emailController;

  /// The controller for the password input field.
  TextEditingController? passwordController;

  /// The controller for the confirm password input field.
  TextEditingController? passwordController1;

  /// The RegisterModel object.
  RegisterModel? registerModelObj;

  /// Flag indicating whether the password is shown or hidden.
  bool isShowPassword;

  /// Flag indicating whether the confirm password is shown or hidden.
  bool isShowPassword1;

  /// Flag indicating whether the container is visible or hidden.
  bool container;

  @override
  List<Object?> get props => [
        nameController,
        emailController,
        passwordController,
        passwordController1,
        isShowPassword,
        isShowPassword1,
        container,
        registerModelObj,
      ];

  /// Creates a copy of the current RegisterState object with optional parameter overrides.
  RegisterState copyWith({
    TextEditingController? nameController,
    TextEditingController? emailController,
    TextEditingController? passwordController,
    TextEditingController? passwordController1,
    bool? isShowPassword,
    bool? isShowPassword1,
    bool? container,
    RegisterModel? registerModelObj,
  }) {
    return RegisterState(
      nameController: nameController ?? this.nameController,
      emailController: emailController ?? this.emailController,
      passwordController: passwordController ?? this.passwordController,
      passwordController1: passwordController1 ?? this.passwordController1,
      isShowPassword: isShowPassword ?? this.isShowPassword,
      isShowPassword1: isShowPassword1 ?? this.isShowPassword1,
      container: container ?? this.container,
      registerModelObj: registerModelObj ?? this.registerModelObj,
    );
  }
}
