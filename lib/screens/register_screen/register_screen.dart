import 'package:email_validator/email_validator.dart';
import 'package:project_v/core/utils/validation_functions.dart';
import 'package:project_v/widgets/custom_floating_text_field.dart';
import 'package:project_v/widgets/custom_elevated_button.dart';
import 'package:project_v/widgets/show_terms_dialog.dart';
import 'models/register_model.dart';
import 'package:flutter/material.dart';
import 'package:project_v/core/app_export.dart';
import 'bloc/register_bloc.dart';

/// The screen for user registration.
class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key? key})
      : super(
          key: key,
        );

  /// Creates a new instance of [RegisterScreen] wrapped in a [BlocProvider].
  static Widget builder(BuildContext context) {
    return BlocProvider<RegisterBloc>(
      create: (context) => RegisterBloc(RegisterState(
        registerModelObj: RegisterModel(),
      ))
        ..add(RegisterInitialEvent()),
      child: RegisterScreen(),
    );
  }

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

/// The screen for user registration.
class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isRegistering = false;
  bool _acceptedTerms = false;

  @override
  Widget build(BuildContext context) {
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
              child: SizedBox(
                width: double.maxFinite,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: double.maxFinite,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          CustomImageView(
                            imagePath: ImageConstant.darkLogo,
                            height: 340.v,
                            width: 340.h,
                            margin: EdgeInsets.symmetric(),
                          ),
                        ],
                      ),
                    ),
                    _buildName(context),
                    SizedBox(height: 8.v),
                    _buildEmail(context),
                    SizedBox(height: 8.v),
                    _buildPassword(context),
                    SizedBox(height: 8.v),
                    _buildPassword1(context),
                    SizedBox(height: 8.v),
                    _buildContainer(context),
                    SizedBox(height: 12.v),
                    _buildButtonRegister(context),
                    SizedBox(height: 17.v),
                    _buildAlreadyhaveAccount(context),
                    SizedBox(height: 5.v),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  /// Builds the "Already have an account?" section.
  Widget _buildAlreadyhaveAccount(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text("msg_do_you_already_have2".tr,
              style: CustomTextStyles.titleSmallff000000),
          InkWell(
            onTap: () => Navigator.pushNamed(context, AppRoutes.loginScreen),
            child: Text(
              "lbl_login_here".tr,
              style: CustomTextStyles.titleSmallff35693e,
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  /// Builds the name input field.
  Widget _buildName(BuildContext context) {
    return BlocSelector<RegisterBloc, RegisterState, TextEditingController?>(
      selector: (state) => state.nameController,
      builder: (context, nameController) {
        return CustomFloatingTextField(
          width: 330.h,
          controller: nameController,
          labelText: "lbl_name".tr,
          labelStyle: theme.textTheme.bodyLarge!,
          hintText: "lbl_name".tr,
          alignment: Alignment.bottomCenter,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) {
            if (!isText(value)) {
              return "err_msg_please_enter_valid_text".tr;
            }
            return null;
          },
        );
      },
    );
  }

  /// Section Widget
  /// Builds the email input field.
  Widget _buildEmail(BuildContext context) {
    return BlocSelector<RegisterBloc, RegisterState, TextEditingController?>(
      selector: (state) => state.emailController,
      builder: (context, emailController) {
        return CustomFloatingTextField(
          width: 330.h,
          controller: emailController,
          labelText: "lbl_email".tr,
          labelStyle: theme.textTheme.bodyLarge!,
          hintText: "lbl_email".tr,
          textInputType: TextInputType.emailAddress,
          alignment: Alignment.bottomCenter,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) {
            if (value == null || EmailValidator.validate(value) == false) {
              return "err_msg_please_enter_valid_email".tr;
            }
            return null;
          },
        );
      },
    );
  }

  /// Section Widget
  /// Builds the password input field.
  Widget _buildPassword(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.h),
      child: BlocBuilder<RegisterBloc, RegisterState>(
        builder: (context, state) {
          return CustomFloatingTextField(
            controller: state.passwordController,
            labelText: "lbl_password".tr,
            labelStyle: theme.textTheme.bodyLarge!,
            hintText: "lbl_password".tr,
            textInputType: TextInputType.visiblePassword,
            obscureText: state.isShowPassword,
            alignment: Alignment.center,
            suffix: InkWell(
              onTap: () {
                context.read<RegisterBloc>().add(ChangePasswordVisibilityEvent(
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
    );
  }

  /// Section Widget
  /// Builds the password confirmation input field.
  Widget _buildPassword1(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.h),
      child: BlocBuilder<RegisterBloc, RegisterState>(
        builder: (context, state) {
          return CustomFloatingTextField(
            controller: state.passwordController1,
            labelText: "msg_password_confirmation".tr,
            labelStyle: theme.textTheme.bodyLarge!,
            hintText: "msg_password_confirmation".tr,
            textInputAction: TextInputAction.done,
            textInputType: TextInputType.visiblePassword,
            obscureText: state.isShowPassword1,
            alignment: Alignment.center,
            suffix: InkWell(
              onTap: () {
                context.read<RegisterBloc>().add(ChangePasswordVisibilityEvent1(
                    value: !state.isShowPassword1));
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
              if (value == null || !isValidPassword(value, isRequired: true)) {
                return "err_msg_please_enter_valid_password".tr;
              } else if (state.passwordController!.text != value) {
                return "err_msg_the_password_confirmation_does_not_match".tr;
              }
              return null;
            },
            autovalidateMode: AutovalidateMode.onUserInteraction,
          );
        },
      ),
    );
  }

  /// Section Widget
  /// Builds the container with the terms and conditions checkbox.
  Widget _buildContainer(BuildContext context) {
    return Padding(
      padding: EdgeInsets.zero,
      child: BlocSelector<RegisterBloc, RegisterState, bool?>(
        selector: (state) => state.container,
        builder: (context, container) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.h),
            child: TermsAndConditions(
              value: _acceptedTerms,
              onChanged: (bool? value) {
                setState(() {
                  _acceptedTerms = value ?? false;
                });
              },
            ),
          );
        },
      ),
    );
  }

  /// Section Widget
  /// Builds the register button.
  Widget _buildButtonRegister(BuildContext context) {
    return CustomElevatedButton(
        height: 42.v,
        text: "lbl_register".tr,
        margin: EdgeInsets.symmetric(horizontal: 46.h),
        alignment: Alignment.center,
        onPressed: () {
          if (_isRegistering || !_formKey.currentState!.validate()) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('err_msg_please_enter_all_fields'.tr)),
            );
            return;
          }
          if (_acceptedTerms) {
            signUp(context);
          } else {
            _showTermsAlert(context);
          }
        });
  }

  /// Function to show alert dialog when terms and conditions are not accepted.
  void _showTermsAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('msg_terms_and_conditions'.tr),
          content: Text('msg_you_must_accept_the_terms'.tr),
          actions: [
            TextButton(
              child: Text("msg_close".tr),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  /// Section Widget
  /// Signs up the user.
  Future<void> signUp(BuildContext context) async {
    setState(() {
      _isRegistering = true;
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

    context.read<RegisterBloc>().registerUser().catchError((e) {
      MyDialogExeception(message: e.toString()).showDialogWithDelay(context);
    }).then((value) => {
          Navigator.pop(context),
          Navigator.pushNamed(context, AppRoutes.loginScreen)
        });

    setState(() {
      _isRegistering = false;
    });
  }
}
