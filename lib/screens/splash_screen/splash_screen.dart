import 'models/splash_model.dart';
import 'package:flutter/material.dart';
import 'package:project_v/core/app_export.dart';
import 'bloc/splash_bloc.dart';

/// The splash screen widget displayed at the start of the application.
class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  /// A builder method that returns a widget tree with the [SplashBloc] provider.
  static Widget builder(BuildContext context) {
    return BlocProvider<SplashBloc>(
        create: (context) =>
            SplashBloc(SplashState(splashModelObj: SplashModel()))
              ..add(SplashInitialEvent()),
        child: SplashScreen());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SplashBloc, SplashState>(builder: (context, state) {
      return SafeArea(
          child: Scaffold(
              body: SizedBox(
                  width: double.maxFinite,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 5.v),
                        CustomImageView(
                            imagePath: ImageConstant.imgBlackAndWhite,
                            height: 380.v,
                            width: 360.h)
                      ]))));
    });
  }
}
