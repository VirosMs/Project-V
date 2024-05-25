import 'package:email_validator/email_validator.dart';
import 'package:project_v/core/utils/validation_functions.dart';
import 'package:project_v/widgets/custom_floating_text_field.dart';
import 'package:project_v/widgets/custom_elevated_button.dart';
import 'models/login_model.dart';
import 'package:flutter/material.dart';
import 'package:project_v/core/app_export.dart';
import 'bloc/login_bloc.dart';

/// The login screen widget.
class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key})
      : super(
          key: key,
        );

  @override
  _LoginScreenState createState() => _LoginScreenState();

  static Widget builder(BuildContext context) {
    return BlocProvider<LoginBloc>(
      create: (context) => LoginBloc(LoginState(
        loginModelObj: LoginModel(),
      ))
        ..add(LoginInitialEvent()),
      child: LoginScreen(),
    );
  }
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isLogging = false;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: SizedBox(
              width: SizeUtils.width,
              child: SingleChildScrollView(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: Form(
                  key: _formKey,
                  child: Container(
                    width: double.maxFinite,
                    padding: EdgeInsets.symmetric(vertical: 5.v),
                    child: Column(
                      children: [
                        CustomImageView(
                            imagePath: ImageConstant.imgBlackAndWhite333x360,
                            height: 333.v,
                            width: 360.h,
                            margin: EdgeInsets.only(left: 35.v)),
                        SizedBox(height: 5.v),
                        _buildTextField(context),
                        SizedBox(height: 20.v),
                        _buildTextField1(context),
                        SizedBox(height: 26.v),
                        _buildButtonLogin(context),
                        SizedBox(height: 13.v),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("msg_you_don_t_have_a2".tr,
                                style: CustomTextStyles.titleSmallff000000),
                            InkWell(
                              onTap: () => Navigator.pushNamed(
                                  context, AppRoutes.registerScreen),
                              child: Text(
                                "lbl_register_here".tr,
                                style: CustomTextStyles.titleSmallff35693e,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 5.v),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  /// Builds the email text field.
  Widget _buildTextField(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadiusStyle.customBorderTL4,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BlocSelector<LoginBloc, LoginState, TextEditingController?>(
            selector: (state) => state.emailController,
            builder: (context, emailController) {
              return CustomFloatingTextField(
                controller: emailController,
                labelText: "lbl_email".tr,
                labelStyle: theme.textTheme.bodyLarge!,
                hintText: "lbl_email".tr,
                textInputType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null ||
                      EmailValidator.validate(value) == false) {
                    return "err_msg_please_enter_valid_email".tr;
                  }
                  return null;
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
              );
            },
          ),
        ],
      ),
    );
  }

  /// Builds the password text field.
  Widget _buildTextField1(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadiusStyle.customBorderTL4,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BlocBuilder<LoginBloc, LoginState>(
            builder: (context, state) {
              return CustomFloatingTextField(
                controller: state.passwordController,
                labelText: "lbl_password".tr,
                labelStyle: theme.textTheme.bodyLarge!,
                hintText: "lbl_password".tr,
                textInputAction: TextInputAction.done,
                textInputType: TextInputType.visiblePassword,
                obscureText: state.isShowPassword,
                suffix: InkWell(
                  onTap: () {
                    context.read<LoginBloc>().add(ChangePasswordVisibilityEvent(
                        value: !state.isShowPassword));
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 12.h),
                    child: CustomImageView(
                      imagePath: ImageConstant.imgContrast,
                      height: 24.adaptSize,
                      width: 24.adaptSize,
                    ),
                  ),
                ),
                suffixConstraints: BoxConstraints(
                  maxHeight: 64.v,
                ),
                validator: (value) {
                  if (value == null ||
                      (!isValidPassword(value, isRequired: true))) {
                    return "err_msg_please_enter_valid_password".tr;
                  }
                  return null;
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
              );
            },
          ),
        ],
      ),
    );
  }

  /// Section Widget
  /// Builds the register button.
  Widget _buildButtonLogin(BuildContext context) {
    return CustomElevatedButton(
      text: "lbl_login".tr,
      margin: EdgeInsets.symmetric(horizontal: 15.h),
      onPressed: () {
        if (!_formKey.currentState!.validate()) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('err_msg_please_enter_all_fields'.tr)),
          );
          return;
        }
        if (_isLogging) {
          return;
        }
        _login(context);
      },
    );
  }

  Future<void> _login(BuildContext context) async {
    setState(() {
      _isLogging = true;
    });

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );

    context
        .read<LoginBloc>()
        .login()
        .onError((Object error, StackTrace stackTrace) {
      MyDialogExeception(message: error.toString())
          .showDialogWithDelay(context);
      return Future.error(error);
    }).then((value) => {
              Navigator.pop(context),
              Navigator.pushNamed(context, AppRoutes.homeContainerScreen),
            });

    setState(() {
      _isLogging = false;
    });
  }
}
