import 'package:huvi_app1/core/app_export.dart';
import 'package:huvi_app1/presentation/uv_status_vone_page/uv_status_vone_page.dart';
import 'package:huvi_app1/widgets/custom_bottom_bar.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class UvStatusVoneContainerScreen extends StatefulWidget {
  UvStatusVoneContainerScreen({Key? key}) : super(key: key);

  @override
  State<UvStatusVoneContainerScreen> createState() => _UvStatusVoneContainerScreenState();
}

class _UvStatusVoneContainerScreenState extends State<UvStatusVoneContainerScreen> {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            backgroundColor: appTheme.gray50,
            body: Navigator(
                key: navigatorKey,
                initialRoute: AppRoutes.uvStatusVonePage,
                onGenerateRoute: (routeSetting) => PageRouteBuilder(
                    pageBuilder: (ctx, ani, ani1) =>
                        getCurrentPage(routeSetting.name!),
                    transitionDuration: Duration(seconds: 0))),
            bottomNavigationBar:
                CustomBottomBar(onChanged: (BottomBarEnum type) {
              Navigator.pushNamed(
                  navigatorKey.currentContext!, getCurrentRoute(type));
            })));
  }

 ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Profile:
        return AppRoutes.profileVoneScreen;
      case BottomBarEnum.Uvdashboard:
        return "/";
      case BottomBarEnum.Analytics:
        return AppRoutes.analyticsContainerScreen;
      default:
        return "/";
    }
  }

  ///Handling page based on route
  Widget getCurrentPage(String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.uvStatusVonePage:
        return UvStatusVonePage();
      default:
        return DefaultWidget();
    }
  }
}
