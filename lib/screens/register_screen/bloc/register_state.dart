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

  TextEditingController? nameController;

  TextEditingController? emailController;

  TextEditingController? passwordController;

  TextEditingController? passwordController1;

  RegisterModel? registerModelObj;

  bool isShowPassword;

  bool isShowPassword1;

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
