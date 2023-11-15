import 'package:flutter/material.dart';
import 'package:huvi_app1/core/app_export.dart';
import 'package:huvi_app1/presentation/analytics_tab_container_page.dart';
import 'package:huvi_app1/widgets/custom_bottom_bar.dart';

// ignore_for_file: must_be_immutable
class AnalyticsContainerScreen extends StatelessWidget {
  AnalyticsContainerScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            body: Navigator(
                initialRoute: AppRoutes.analyticsTabContainerPage,
                onGenerateRoute: (routeSetting) => PageRouteBuilder(
                    pageBuilder: (ctx, ani, ani1) =>
                        getCurrentPage(routeSetting.name!),
                    transitionDuration: Duration(seconds: 0))),
            bottomNavigationBar: CustomBottomBar()));
  }



  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Analytics:
        return "/";
      case BottomBarEnum.Uvdashboard:
        return AppRoutes.uvStatusVoneContainerScreen;
      case BottomBarEnum.Profile:
        return AppRoutes.profileVoneScreen;
      default:
        return "/";
    }
  }

  ///Handling page based on route
  Widget getCurrentPage(String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.analyticsTabContainerPage:
        return AnalyticsContainerScreen();
      default:
        return DefaultWidget();
    }
  }
}
