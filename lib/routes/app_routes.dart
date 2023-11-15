import 'package:flutter/material.dart';
import 'package:huvi_app1/presentation/analytics_container_screen.dart';
import 'package:huvi_app1/presentation/sign_up_vone_screen/sign_up_vone_screen.dart';
import 'package:huvi_app1/presentation/login_vtwo_screen/login_vtwo_screen.dart';
import 'package:huvi_app1/presentation/profile_vone_screen/profile_vone_screen.dart';
import 'package:huvi_app1/presentation/welcome_vtwo_screen/welcome_vtwo_screen.dart';
import 'package:huvi_app1/presentation/uv_status_vone_container_screen/uv_status_vone_container_screen.dart';
import 'package:huvi_app1/presentation/recommendation_vone_screen/recommendation_vone_screen.dart';
import 'package:huvi_app1/presentation/app_navigation_screen/app_navigation_screen.dart';

import 'package:huvi_app1/presentation/edit_profile_screen.dart';
import 'package:huvi_app1/presentation/analytics_page.dart';

class AppRoutes {
  static const String signUpVoneScreen = '/sign_up_vone_screen';

  static const String loginVtwoScreen = '/login_vtwo_screen';

  static const String profileVoneScreen = '/profile_vone_screen';

  static const String welcomeVtwoScreen = '/welcome_vtwo_screen';

  static const String uvStatusVonePage = '/uv_status_vone_page';

  static const String uvStatusVoneContainerScreen =
      '/uv_status_vone_container_screen';

  static const String recommendationVoneScreen = '/recommendation_vone_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String editProfileScreen = '/edit_profile_screen';

  static const String analyticsPage = '/analytics_page';

  static const String analyticsTabContainerPage =
      '/analytics_tab_container_page';

  static const String analyticsContainerScreen = '/analytics_container_screen';


  static Map<String, WidgetBuilder> routes = {
    signUpVoneScreen: (context) => SignUpVoneScreen(),
    loginVtwoScreen: (context) => LoginVtwoScreen(),
    profileVoneScreen: (context) => ProfileVoneScreen(),
    welcomeVtwoScreen: (context) => WelcomeVtwoScreen(),
    uvStatusVoneContainerScreen: (context) => UvStatusVoneContainerScreen(),
    recommendationVoneScreen: (context) => RecommendationVoneScreen(),
    appNavigationScreen: (context) => AppNavigationScreen(),
    editProfileScreen: (context) => EditProfileScreen(),
    analyticsPage: (context) => AnalyticsPage(),
    analyticsContainerScreen: (context) => AnalyticsContainerScreen(),
  };
}
