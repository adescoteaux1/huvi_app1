import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:huvi_app1/core/app_export.dart';
import 'package:huvi_app1/presentation/analytics_container_screen.dart';
import 'package:huvi_app1/presentation/analytics_page.dart';
import 'package:huvi_app1/presentation/analytics_tab_container_page.dart';
import 'package:huvi_app1/presentation/edit_profile_screen.dart';
import 'package:huvi_app1/widgets/app_bar/appbar_image.dart';
import 'package:huvi_app1/widgets/app_bar/appbar_image_1.dart';
import 'package:huvi_app1/widgets/app_bar/custom_app_bar.dart';
import 'package:huvi_app1/widgets/custom_elevated_button.dart';
import 'package:huvi_app1/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:huvi_app1/presentation/uv_status_vone_container_screen/uv_status_vone_container_screen.dart' as key;

import '../../widgets/custom_bottom_bar.dart';

class ProfileVoneScreen extends StatefulWidget {
  ProfileVoneScreen({Key? key})
      : super(
          key: key,
        );

  @override
  State<ProfileVoneScreen> createState() => _ProfileVoneScreenState();
}

class _ProfileVoneScreenState extends State<ProfileVoneScreen> {
  //current user logged in
  User? currentUser = FirebaseAuth.instance.currentUser;

  //future to fetch user details
  Future<DocumentSnapshot<Map<String, dynamic>>> getUserDetails() async {
    return await FirebaseFirestore.instance
      .collection("Users")
      .doc(currentUser!.email)
      .get();
  }

  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  TextEditingController buttononeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.gray50,
        resizeToAvoidBottomInset: false,
        body: SizedBox(
          width: 395.h,
          child: Column(
            children: [
              SizedBox(
                height: 186.v,
                width: 395.h,
                child: Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        height: 170.v,
                        width: 395.h,
                        decoration: AppDecoration.fillYellow,
                        child: Stack(
                          alignment: Alignment.topLeft,
                          children: [
                            CustomAppBar(
                              leadingWidth: 44.h,
                              leading: AppbarImage(
                                svgPath: ImageConstant.imgArrowright,
                                margin: EdgeInsets.only(left: 20.h),
                              ),
                              actions: [
                                AppbarImage1(
                                  svgPath: ImageConstant.imgDotshorizontal,
                                  margin: EdgeInsets.only(
                                    left: 40.h,
                                    right: 40.h,
                                    bottom: 4.v,
                                  ),
                                ),
                              ],
                            ),
                            CustomImageView(
                              imagePath:
                                  ImageConstant.imgHuvilogo1removebgpreview,
                              height: 118.v,
                              width: 111.h,
                              alignment: Alignment.topLeft,
                              margin: EdgeInsets.only(
                                left: 134.h,
                                top: 7.v,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    CustomElevatedButton(
                      width: 335.h,
                      text: "EDIT PROFILE",
                      margin: EdgeInsets.only(left: 18.h),
                      leftIcon: Container(
                        margin: EdgeInsets.only(right: 17.h),
                        child: CustomImageView(
                          svgPath: ImageConstant.imgEdit,
                        ),
                      ),
                      buttonStyle: CustomButtonStyles.outlineBlack,
                      buttonTextStyle: CustomTextStyles.titleMediumGray50,
                      alignment: Alignment.bottomLeft,
                      onTap: () {
                          // Replace 'YourRouteNameHere' with the actual route name to navigate to the login screen.
                          
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>  EditProfileScreen()),
                          );
                        },
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        height: 186.v,
                        width: 346.h,
                        child: Stack(
                          alignment: Alignment.bottomLeft,
                          children: [
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Padding(
                                padding: EdgeInsets.only(bottom: 75.v),
                                child: Text(
                                  "Age: 32",
                                  style: theme.textTheme.bodyLarge,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Padding(
                                padding: EdgeInsets.only(bottom: 51.v),
                                child: Text(
                                  "Eye color: Blue",
                                  style: theme.textTheme.bodyLarge,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: SizedBox(
                                height: 186.v,
                                width: 346.h,
                                child: Stack(
                                  alignment: Alignment.topLeft,
                                  children: [
                                    Align(
                                      alignment: Alignment.bottomCenter,
                                      child: SizedBox(
                                        width: 346.h,
                                        child: Text(
                                          "Skin details: burns easily, applies sunscreen\n      regularly,  \n ",
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: theme.textTheme.bodyLarge!
                                              .copyWith(
                                            height: 1.50,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Padding(
                                        padding: EdgeInsets.only(top: 11.v),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(left: 1.h),
                                              child: Text(
                                                "Jennifer",
                                                style: CustomTextStyles
                                                    .headlineLargeYellow900Bold,
                                              ),
                                            ),
                                            SizedBox(height: 14.v),
                                            Text(
                                              "Fair Skin",
                                              style: theme.textTheme.bodyLarge,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    CustomImageView(
                                      imagePath:
                                          ImageConstant.imgProfilepicjennifer,
                                      height: 144.v,
                                      width: 142.h,
                                      alignment: Alignment.topRight,
                                      margin: EdgeInsets.only(right: 15.h),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 36.v),
                    CustomImageView(
                      svgPath: ImageConstant.imgDivider,
                      height: 1.v,
                      width: 344.h,
                      alignment: Alignment.center,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 16.h,
                        top: 10.v,
                        right: 49.h,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Stats:",
                                  style: theme.textTheme.headlineSmall,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 7.h,
                                    top: 6.v,
                                  ),
                                  child: RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: "Total Sun Time",
                                          style: theme.textTheme.titleMedium,
                                        ),
                                        TextSpan(
                                          text: ":",
                                          style: theme.textTheme.bodyLarge,
                                        ),
                                        TextSpan(
                                          text: "  54 hr 20m",
                                          style: theme.textTheme.bodyLarge,
                                        ),
                                        TextSpan(
                                          text: " ",
                                        ),
                                      ],
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 7.h,
                                    top: 9.v,
                                  ),
                                  child: RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: "Daily Average Sun Time: ",
                                          style: theme.textTheme.titleMedium,
                                        ),
                                        TextSpan(
                                          text: "24m ",
                                          style: theme.textTheme.bodyLarge,
                                        ),
                                      ],
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 7.h,
                                    top: 5.v,
                                  ),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(top: 3.v),
                                        child: RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text:
                                                    "HUVI Protection Rating:  ",
                                                style:
                                                    theme.textTheme.titleMedium,
                                              ),
                                              TextSpan(
                                                text: "B+ ",
                                                style:
                                                    theme.textTheme.bodyLarge,
                                              ),
                                            ],
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                      ),
                                      CustomImageView(
                                        svgPath:
                                            ImageConstant.imgQuestionmarkcircle,
                                        height: 24.adaptSize,
                                        width: 24.adaptSize,
                                        margin: EdgeInsets.only(left: 5.h),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          CustomImageView(
                                    svgPath: ImageConstant.imgSun,
                                    height: 85.adaptSize,
                                    width: 85.adaptSize),
                        ],
                      ),
                    ),
                    
                    CustomElevatedButton(
                      width: 200.h,
                      height: 25.v,
                      text: "View Analytics",
                      margin: EdgeInsets.only(left: 18.h),
                      leftIcon: Container(
                        margin: EdgeInsets.fromLTRB(5.h, 3.v, 5.h, 2.v),
                        child: CustomImageView(
                          svgPath: ImageConstant.imgChartBar,
                        ),
                      ),
                      buttonStyle: CustomButtonStyles.outlineBlack,
                      buttonTextStyle: CustomTextStyles.titleMediumGray50,
                      alignment: Alignment.bottomLeft,
                      onTap: () {
                          // Replace 'YourRouteNameHere' with the actual route name to navigate to the login screen.
                          
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>  AnalyticsTabContainerPage()),
                          );
                        },
                    ),
                    SizedBox(height: 13.v),
                    CustomImageView(
                      svgPath: ImageConstant.imgDivider,
                      height: 1.v,
                      width: 344.h,
                      alignment: Alignment.center,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 15.h,
                        top: 12.v,
                        right: 40.h,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(bottom: 18.v),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Achievements:",
                                    style: CustomTextStyles.titleLargeYellow900,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: 5.h,
                                      top: 17.v,
                                      right: 1.h,
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 4.v,
                                          width: 60.h,
                                          decoration: BoxDecoration(
                                            color: appTheme.indigo100,
                                            borderRadius: BorderRadius.circular(
                                              2.h,
                                            ),
                                          ),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(
                                              2.h,
                                            ),
                                            child: LinearProgressIndicator(
                                              value: 0.65,
                                              backgroundColor:
                                                  appTheme.indigo100,
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                appTheme.yellow900,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: 4.v,
                                          width: 30.h,
                                          margin: EdgeInsets.only(left: 8.h),
                                          decoration: BoxDecoration(
                                            color: appTheme.indigo100,
                                            borderRadius: BorderRadius.circular(
                                              2.h,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: 4.v,
                                          width: 47.h,
                                          margin: EdgeInsets.only(left: 8.h),
                                          decoration: BoxDecoration(
                                            color: appTheme.indigo100,
                                            borderRadius: BorderRadius.circular(
                                              2.h,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: 4.v,
                                          width: 30.h,
                                          margin: EdgeInsets.only(left: 7.h),
                                          decoration: BoxDecoration(
                                            color: appTheme.indigo100,
                                            borderRadius: BorderRadius.circular(
                                              2.h,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                      top: 18.v,
                                      right: 5.h,
                                    ),
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 5.h),
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 4.v,
                                          width: 65.h,
                                          decoration: BoxDecoration(
                                            color: appTheme.yellow900,
                                            borderRadius: BorderRadius.circular(
                                              2.h,
                                            ),
                                          ),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(
                                              2.h,
                                            ),
                                            child: LinearProgressIndicator(
                                              value: 0.98,
                                              backgroundColor:
                                                  appTheme.yellow900,
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                appTheme.indigo100,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: 4.v,
                                          width: 60.h,
                                          margin: EdgeInsets.only(left: 8.h),
                                          decoration: BoxDecoration(
                                            color: appTheme.indigo100,
                                            borderRadius: BorderRadius.circular(
                                              2.h,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: 6.h,
                                      top: 17.v,
                                    ),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          height: 4.v,
                                          width: 60.h,
                                          child: Stack(
                                            alignment: Alignment.center,
                                            children: [
                                              Align(
                                                alignment: Alignment.center,
                                                child: SizedBox(
                                                  width: 79.h,
                                                  child: Divider(
                                                    color: appTheme.indigo100,
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: Alignment.center,
                                                child: SizedBox(
                                                  width: 79.h,
                                                  child: Divider(
                                                    color: appTheme.yellow900,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 8.h),
                                          child: Container(
                                            height: 4.v,
                                            width: 37.h,
                                            decoration: BoxDecoration(
                                              color: appTheme.yellow900,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                2.h,
                                              ),
                                            ),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                2.h,
                                              ),
                                              child: LinearProgressIndicator(
                                                value: 0.98,
                                                backgroundColor:
                                                    appTheme.yellow900,
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  appTheme.indigo100,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 60.h,
                                          child: Divider(
                                            color: appTheme.indigo100,
                                            indent: 8.h,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 60.h,
                                          child: Divider(
                                            color: appTheme.indigo100,
                                            indent: 8.h,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              left: 24.h,
                              top: 17.v,
                            ),
                            padding: EdgeInsets.all(8.h),
                            decoration: AppDecoration.outlineBlueGray.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder10,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomImageView(
                                  svgPath: ImageConstant.imgSun,
                                  height: 49.adaptSize,
                                  width: 49.adaptSize,
                                ),
                                SizedBox(height: 6.v),
                                Text(
                                  "GOLD",
                                  style:
                                      CustomTextStyles.labelLargeInterWhiteA700,
                                ),
                                SizedBox(height: 1.v),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    CustomElevatedButton(
                      height: 29.v,
                      width: 200.h,
                      text: "View More",
                      margin: EdgeInsets.only(left: 22.h),
                      buttonStyle: CustomButtonStyles.outlineBlackTL14,
                    ),
                    Spacer(),
                    CustomImageView(
                      imagePath: ImageConstant.imgProfilepicjennifer1x395,
                      height: 1.v,
                      width: 395.h,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: CustomBottomBar()
      ),
    );
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Profile:
        return AppRoutes.profileVoneScreen;
      case BottomBarEnum.Uvdashboard:
        return AppRoutes.uvStatusVoneContainerScreen;
      case BottomBarEnum.Analytics:
        return AppRoutes.analyticsContainerScreen;
      default:
        return "/";
    }
  }

  ///Handling page based on route
  Widget getCurrentPage(String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.profileVoneScreen:
        return ProfileVoneScreen();
      default:
        return DefaultWidget();
    }
  }
}
