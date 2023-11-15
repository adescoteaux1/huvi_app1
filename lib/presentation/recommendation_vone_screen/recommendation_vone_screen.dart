import 'package:huvi_app1/core/app_export.dart';
import 'package:huvi_app1/presentation/uv_status_vone_page/uv_status_vone_page.dart';
import 'package:huvi_app1/widgets/app_bar/appbar_image.dart';
import 'package:huvi_app1/widgets/app_bar/appbar_title.dart';
import 'package:huvi_app1/widgets/app_bar/custom_app_bar.dart';
import 'package:huvi_app1/widgets/custom_bottom_bar.dart';
import 'package:huvi_app1/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class RecommendationVoneScreen extends StatelessWidget {
  RecommendationVoneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            backgroundColor: appTheme.yellow700.withOpacity(0.68),
            appBar: CustomAppBar(
                height: 42.v,
                leadingWidth: 41.h,
                leading: AppbarImage(
                    svgPath: ImageConstant.imgArrowleftYellow900,
                    margin: EdgeInsets.only(left: 17.h, top: 9.v, bottom: 9.v),
                    onTap: () {
                      onTapArrowleftone(context);
                    }),
                title: AppbarTitle(
                    text: "RECOMMENDATIONS ",
                    margin: EdgeInsets.only(left: 143.h))),
            body: Container(
                width: 395.h,
                padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 8.v),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding: EdgeInsets.only(left: 55.h),
                          child: Text("High UV Level:",
                              style: theme.textTheme.headlineLarge)),
                      Align(
                          alignment: Alignment.center,
                          child: Container(
                              width: 282.h,
                              margin: EdgeInsets.only(
                                  left: 32.h, top: 5.v, right: 40.h),
                              child: Text(
                                  "Try to find some shade\n\nReapply Sunscreen every 45 minutes\n\nWhite sand, water, and other bright surfaces reflect UVs and increase risk of exposure",
                                  maxLines: 9,
                                  overflow: TextOverflow.ellipsis,
                                  style: theme.textTheme.titleLarge!
                                      .copyWith(height: 1.27)))),
                      CustomElevatedButton(
                          text: "Learn More",
                          margin: EdgeInsets.only(
                              left: 1.h, top: 13.v, right: 19.h)),
                      SizedBox(height: 30.v),
                      RichText(
                          text: TextSpan(children: [
                            TextSpan(text: " "),
                            TextSpan(
                                text: "Actions:\n",
                                style: CustomTextStyles.headlineMediumBold)
                          ]),
                          textAlign: TextAlign.left),
                      CustomElevatedButton(
                          text: "SET SUNSCREEN TIMER",
                          margin: EdgeInsets.only(
                              left: 1.h, top: 17.v, right: 18.h),
                          leftIcon: Container(
                              margin: EdgeInsets.only(right: 2.h),
                              child: CustomImageView(
                                  svgPath: ImageConstant.imgClockGray100))),
                      CustomElevatedButton(
                          text: "ENABLE UV ALERTS",
                          margin: EdgeInsets.only(
                              top: 9.v, right: 19.h, bottom: 5.v),
                          leftIcon: Container(
                              margin: EdgeInsets.only(right: 17.h),
                              child: CustomImageView(
                                  svgPath: ImageConstant.imgNotification)))
                    ])),
            //bottomNavigationBar:
               // CustomBottomBar(onChanged: (BottomBarEnum type) {
             // Navigator.pushNamed(
             //     navigatorKey.currentContext!, getCurrentRoute(type));
            //})
            ));
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Profile:
        return AppRoutes.profileVoneScreen;
      case BottomBarEnum.Uvdashboard:
        return AppRoutes.uvStatusVonePage;
      case BottomBarEnum.Analytics:
        return "/";
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

  /// Navigates back to the previous screen.
  ///
  /// This function takes a [BuildContext] object as a parameter, which is used
  /// to navigate back to the previous screen.
  onTapArrowleftone(BuildContext context) {
    Navigator.pop(context);
  }
}
