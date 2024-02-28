import 'package:project_v/core/utils/validation_functions.dart';
import 'package:project_v/widgets/custom_floating_text_field.dart';
import 'package:project_v/widgets/custom_elevated_button.dart';
import 'models/login_model.dart';
import 'package:flutter/material.dart';
import 'package:project_v/core/app_export.dart';
import 'bloc/login_bloc.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key})
      : super(
          key: key,
        );

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<LoginBloc>(
      create: (context) => LoginBloc(LoginState(
        loginModelObj: LoginModel(),
      ))
        ..add(LoginInitialEvent()),
      child: LoginScreen(),
    );
  }

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
                        CustomElevatedButton(
                          text: "lbl_login".tr,
                          onPressed: () => Navigator.pushNamed(
                              context, AppRoutes.homeContainerScreen),
                          margin: EdgeInsets.only(
                            left: 44.h,
                            right: 41.h,
                          ),
                        ),
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

  /// Section Widget
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
                      (!isValidEmail(value, isRequired: true))) {
                    return "err_msg_please_enter_valid_email".tr;
                  }
                  return null;
                },
              );
            },
          ),
          
          
        ],
      ),
    );
  }

  /// Section Widget
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
              );
            },
          ),
          
        ],
      ),
    );
  }
}
