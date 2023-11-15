import 'package:flutter/material.dart';
import 'package:huvi_app1/core/app_export.dart';
import 'package:huvi_app1/presentation/analytics_container_screen.dart';
import 'package:huvi_app1/presentation/analytics_page.dart';
import 'package:huvi_app1/presentation/analytics_tab_container_page.dart';
import 'package:huvi_app1/presentation/profile_vone_screen/profile_vone_screen.dart';
import 'package:huvi_app1/presentation/uv_status_vone_container_screen/uv_status_vone_container_screen.dart';
import 'package:huvi_app1/presentation/uv_status_vone_page/uv_status_vone_page.dart';
import 'package:huvi_app1/widgets/custom_image_view.dart';
import 'package:huvi_app1/core/utils/image_constant.dart';

class CustomBottomBar extends StatefulWidget {
  CustomBottomBar({this.onChanged});

  Function(BottomBarEnum)? onChanged;

  @override
  CustomBottomBarState createState() => CustomBottomBarState();
}

class CustomBottomBarState extends State<CustomBottomBar> {
  int selectedIndex = 0;

  List<BottomMenuModel> bottomMenuList = [
    BottomMenuModel(
      icon: ImageConstant.imgChartBarOnerrorcontainer,
      activeIcon: ImageConstant.imgChartBarOnerrorcontainer,
      title: "Analytics",
      type: BottomBarEnum.Analytics,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgSunOnerrorcontainer,
      activeIcon: ImageConstant.imgSunOnerrorcontainer,
      title: "UV Dashboard",
      type: BottomBarEnum.Uvdashboard,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgNavProfile,
      activeIcon: ImageConstant.imgNavProfile,
      title: "Profile",
      type: BottomBarEnum.Profile,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 87.v,
      decoration: BoxDecoration(
        color: appTheme.gray5001,
        border: Border(
          top: BorderSide(
            color: theme.colorScheme.primary.withOpacity(1),
            width: 4.h,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.primary,
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              0,
              4,
            ),
          ),
        ],
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedFontSize: 0,
        elevation: 0,
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.fixed,
        items: List.generate(bottomMenuList.length, (index) {
          return BottomNavigationBarItem(
            icon: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomImageView(
                  svgPath: bottomMenuList[index].icon,
                  height: 40.adaptSize,
                  width: 40.adaptSize,
                  color: theme.colorScheme.onErrorContainer,
                ),
                Text(
                  bottomMenuList[index].title ?? "",
                  style: CustomTextStyles.labelLargeRobotoPrimaryContainer
                      .copyWith(
                    color: theme.colorScheme.primaryContainer,
                  ),
                ),
              ],
            ),
            activeIcon: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomImageView(
                  svgPath: bottomMenuList[index].activeIcon,
                  height: 32.adaptSize,
                  width: 32.adaptSize,
                  color: theme.colorScheme.onErrorContainer,
                ),
                Text(
                  bottomMenuList[index].title ?? "",
                  style: CustomTextStyles.labelLargeRobotoGray800.copyWith(
                    color: appTheme.gray800,
                  ),
                ),
              ],
            ),
            label: '',
          );
        }),
        onTap: (index) {
          selectedIndex = index;
          widget.onChanged?.call(bottomMenuList[index].type);

          // Navigation logic based on the selected item type
            switch (bottomMenuList[index].type) {
              case BottomBarEnum.Analytics:
                // Navigate to Analytics screen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          AnalyticsTabContainerPage()),
                );
                break;
              case BottomBarEnum.Uvdashboard:
                // Navigate to UV Dashboard screen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          UvStatusVoneContainerScreen()),
                );
                break;
              case BottomBarEnum.Profile:
                // Navigate to Profile screen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          ProfileVoneScreen()),
                );
                break;
            }

          setState(() {});
        },
      ),
    );
  }
}

enum BottomBarEnum {
  Analytics,
  Uvdashboard,
  Profile,
}

class BottomMenuModel {
  BottomMenuModel({
    required this.icon,
    required this.activeIcon,
    this.title,
    required this.type,
  });

  String icon;

  String activeIcon;

  String? title;

  BottomBarEnum type;
}

class DefaultWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(10),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Please replace the respective Widget here',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}