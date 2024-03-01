

part of 'login_bloc.dart';

/// Represents the state of Login in the application.
class LoginState extends Equatable {
  LoginState({
    this.emailController,
    this.passwordController,
    this.isShowPassword = true,
    this.loginModelObj,
  });

  /// The controller for the email input field.
  final TextEditingController? emailController;

  /// The controller for the password input field.
  final TextEditingController? passwordController;

  /// The login model object.
  final LoginModel? loginModelObj;

  /// Indicates whether the password is currently shown or hidden.
  final bool isShowPassword;

  @override
  List<Object?> get props => [
        emailController,
        passwordController,
        isShowPassword,
        loginModelObj,
      ];

  /// Creates a new instance of [LoginState] with the provided values.
  LoginState copyWith({
    TextEditingController? emailController,
    TextEditingController? passwordController,
    bool? isShowPassword,
    LoginModel? loginModelObj,
  }) {
    return LoginState(
      emailController: emailController ?? this.emailController,
      passwordController: passwordController ?? this.passwordController,
      isShowPassword: isShowPassword ?? this.isShowPassword,
      loginModelObj: loginModelObj ?? this.loginModelObj,
    );
  }
}
