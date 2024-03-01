import 'package:project_v/screens/home_page/home_page.dart';
import 'package:project_v/screens/favorite_page/favorite_page.dart';
import 'package:project_v/widgets/custom_bottom_bar.dart';
import 'models/home_container_model.dart';
import 'package:flutter/material.dart';
import 'package:project_v/core/app_export.dart';
import 'bloc/container_bloc.dart';

/// The screen that contains the home container.
class HomeContainerScreen extends StatelessWidget {
  HomeContainerScreen({Key? key}) : super(key: key);

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  /// Creates a [HomeContainerScreen] widget using a builder pattern.
  static Widget builder(BuildContext context) {
    return BlocProvider<ContainerBloc>(
        create: (context) => ContainerBloc(
            ContainerState(homeContainerModelObj: HomeContainerModel()))
          ..add(ContainerInitialEvent()),
        child: HomeContainerScreen());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContainerBloc, ContainerState>(
        builder: (context, state) {
      return SafeArea(
          child: Scaffold(
              body: Navigator(
                  key: navigatorKey,
                  initialRoute: AppRoutes.homePage,
                  onGenerateRoute: (routeSetting) => PageRouteBuilder(
                      pageBuilder: (ctx, ani, ani1) =>
                          getCurrentPage(context, routeSetting.name!),
                      transitionDuration: Duration(seconds: 0))),
              bottomNavigationBar: _buildBottomBar(context)));
    });
  }

  /// Builds the bottom navigation bar widget.
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(onChanged: (BottomBarEnum type) {
      Navigator.pushNamed(navigatorKey.currentContext!, getCurrentRoute(type));
    });
  }

  /// Gets the current route based on the selected [BottomBarEnum] type.
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Home:
        return AppRoutes.homePage;
      case BottomBarEnum.Favorite:
        return AppRoutes.favoritePage;
      case BottomBarEnum.Profile:
        return "/";
      default:
        return "/";
    }
  }

  /// Gets the current page widget based on the current route.
  Widget getCurrentPage(
    BuildContext context,
    String currentRoute,
  ) {
    switch (currentRoute) {
      case AppRoutes.homePage:
        return HomePage.builder(context);
      case AppRoutes.favoritePage:
        return FavoritePage.builder(context);
      default:
        return DefaultWidget();
    }
  }
}
