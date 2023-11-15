import 'package:flutter/material.dart';
import 'package:huvi_app1/core/app_export.dart';
import 'package:huvi_app1/presentation/analytics_page.dart';
import 'package:huvi_app1/presentation/uv_data_screen.dart' as uv;
import 'package:huvi_app1/widgets/app_bar/appbar_leading_image.dart';
import 'package:huvi_app1/widgets/app_bar/appbar_title.dart';
import 'package:huvi_app1/widgets/app_bar/custom_app_bar.dart';
import 'package:huvi_app1/widgets/custom_bottom_bar.dart';
import 'package:huvi_app1/widgets/custom_elevated_button.dart';
import 'package:huvi_app1/presentation/analytics_page.dart' as ap;

import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;

import '../widgets/app_bar/appbar_image.dart';

class AnalyticsTabContainerPage extends StatefulWidget {
  const AnalyticsTabContainerPage({Key? key}) : super(key: key);

  @override
  AnalyticsTabContainerPageState createState() =>
      AnalyticsTabContainerPageState();
}

// ignore_for_file: must_be_immutable
class AnalyticsTabContainerPageState extends State<AnalyticsTabContainerPage>
    with TickerProviderStateMixin {
  late TabController tabviewController;

  @override
  void initState() {
    super.initState();
    tabviewController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      
        child: Scaffold(
          backgroundColor: appTheme.yellow700,
            appBar: _buildAppBar(context),
            body: SizedBox(
                width: mediaQueryData.size.width,
                
                child: SingleChildScrollView(
                    padding: EdgeInsets.only(top: 42.v),
                    
                    child: SizedBox(
                        height: 602.v,
                        width: 395.h,
                        child: Stack(alignment: Alignment.center, children: [
                          _buildStatisticsSection(context),
                           
                          Container(child: Stack(alignment: Alignment.center, children: [_buildActivitySection(context),
                            Container( child:_buildPlaylist(context),
                            margin: EdgeInsets.only(left: 15.h, right: 15.h, bottom: 200.v),

                                        
                                        decoration: AppDecoration.outlineOnSecondaryContainer
                .copyWith(borderRadius: BorderRadiusStyle.roundedBorder24, color: Colors.white,),)]))
                        ])))),
                        bottomNavigationBar: CustomBottomBar()));
  }


  Widget _buildActivitySectionAndPlaylist(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      _buildActivitySection(context),
      Container(
        color: Colors.white, // Set the background color to white
        child: _buildPlaylist(context),
        padding: EdgeInsets.only(top: 50.h),
      ),
    ],
  );
}

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        height: 38.v,
        leadingWidth: 49.h,
        leading: AppbarLeadingImage(
            svgPath: ImageConstant.imgArrowLeft,
            margin: EdgeInsets.only(left: 25.h, top: 3.v, bottom: 11.v),
            onTap: () {
              onTapArrowLeft(context);
            }),
        centerTitle: true,
        title: AppbarTitle(text: "Analytics"));
  }

  /// Section Widget
  Widget _buildStatisticsSection(BuildContext context) {
    return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
            margin: EdgeInsets.only(left: 22.h, right: 19.h, bottom: 2.v),
            decoration: AppDecoration.fillYellow,
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: EdgeInsets.only(left: 4.h),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                                child: Container(
                                    margin: EdgeInsets.only(right: 17.h),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 5.h, vertical: 12.v),
                                    decoration: AppDecoration
                                        .outlineOnSecondaryContainer
                                        .copyWith(
                                            borderRadius: BorderRadiusStyle
                                                .roundedBorder24),
                                    child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(left: 6.h),
                                              child: Text("   Statistics",
                                                  style: CustomTextStyles
                                                      .bodySmallGray600)),
                                          SizedBox(height: 8.v),
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(left: 1.h),
                                              child: Text(
                                                  " Daily Avg. Sun Time",
                                                  style: CustomTextStyles
                                                      .bodyLargeGray900)),
                                          SizedBox(height: 5.v),
                                          Align(
                                              alignment: Alignment.center,
                                              child: RichText(
                                                  text: TextSpan(children: [
                                                    TextSpan(
                                                        text: "1.3",
                                                        style: CustomTextStyles
                                                            .displayMediumRoboto),
                                                    TextSpan(
                                                        text: "Hrs",
                                                        style: CustomTextStyles
                                                            .titleSmallGreen900)
                                                  ]),
                                                  textAlign: TextAlign.left)),
                                          SizedBox(height: 2.v),
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(left: 22.h),
                                              child: Row(children: [
                                                Text("+21.01%",
                                                    style: CustomTextStyles
                                                        .titleSmallGreen900),
                                                CustomImageView(
                                                    svgPath:
                                                        ImageConstant.imgArrow,
                                                    height: 10.v,
                                                    width: 14.h,
                                                    margin: EdgeInsets.only(
                                                        left: 5.h,
                                                        top: 3.v,
                                                        bottom: 3.v))
                                              ]))
                                        ]))),
                            Expanded(
                                child: Container(
                                    margin: EdgeInsets.only(left: 17.h),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 11.h, vertical: 12.v),
                                    decoration: AppDecoration
                                        .outlineOnSecondaryContainer
                                        .copyWith(
                                            borderRadius: BorderRadiusStyle
                                                .roundedBorder24),
                                    child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("   Statistics",
                                              style: CustomTextStyles
                                                  .bodySmallGray600),
                                          SizedBox(height: 5.v),
                                          Align(
                                              alignment: Alignment.center,
                                              child: Text("    Sun Time Today",
                                                  style: CustomTextStyles
                                                      .bodyLargeGray900)),
                                          SizedBox(height: 2.v),
                                          Align(
                                              alignment: Alignment.center,
                                              child: RichText(
                                                  text: TextSpan(children: [
                                                    TextSpan(
                                                        text: "45",
                                                        style: CustomTextStyles
                                                            .displayMediumRoboto),
                                                    TextSpan(
                                                        text: "min",
                                                        style: CustomTextStyles
                                                            .titleSmallGreen900)
                                                  ]),
                                                  textAlign: TextAlign.left)),
                                          SizedBox(height: 9.v),
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(left: 14.h),
                                              child: Row(children: [
                                                Text("+7.64%",
                                                    style: CustomTextStyles
                                                        .titleSmallGreen900),
                                                CustomImageView(
                                                    svgPath:
                                                        ImageConstant.imgArrow,
                                                    height: 10.v,
                                                    width: 14.h,
                                                    margin: EdgeInsets.only(
                                                        left: 5.h,
                                                        top: 3.v,
                                                        bottom: 3.v))
                                              ]))
                                        ])))
                          ])),
                  SizedBox(height: 15.v),
                  CustomElevatedButton(
                      height: 42.v,
                      text: "View UV Data",
                      margin: EdgeInsets.only(right: 13.h),
                      buttonStyle: CustomButtonStyles.outlinePrimaryTL21,
                      buttonTextStyle: CustomTextStyles.titleLargeInterGray5001,
                      onTap: () {
                          // Replace 'YourRouteNameHere' with the actual route name to navigate to the login screen.
                          showDialog(context: context, 
                            builder: (context) => AlertDialog(
                              content: Center(child: SizedBox(
                                width: MediaQuery.of(context).size.width, 
                                height: 700.h,
                                child: uv.UvDataScreen())),
                              insetPadding: EdgeInsets.zero,
                              actions: [
                                TextButton(
                                  child: Text('OK'),
                                  onPressed: () => Navigator.pop(context)), 
                              ]
                            ));
                          
                        },)
                ])));
  }

  /// Section Widget
  Widget _buildActivitySection(BuildContext context) {
    return Align(
        alignment: Alignment.topCenter,
        child: Container(
            margin: EdgeInsets.only(left: 15.h, right: 10.h, bottom: 553.v),
            decoration: AppDecoration.outlineOnSecondaryContainer
                .copyWith(borderRadius: BorderRadiusStyle.roundedBorder24, color: Colors.white,),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: EdgeInsets.only(top: 4.v, left: 10.h),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Activity", style: theme.textTheme.bodyMedium),
                            SizedBox(height: 3.v),
                            Text("Sun Time:",
                                style: CustomTextStyles.titleLargeInterGray900)
                          ])),
                  Container(
                      height: 34.v,
                      width: 240.h,
                      margin: EdgeInsets.only(bottom: 15.v, right: 2.h),
                      decoration: BoxDecoration(
                          color: appTheme.gray10001,
                          borderRadius: BorderRadius.circular(17.h)),
                      child: TabBar(
                          controller: tabviewController,
                          labelPadding: EdgeInsets.zero,
                          labelColor: appTheme.whiteA700,
                          labelStyle: TextStyle(
                              fontSize: 12.fSize,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500),
                          unselectedLabelColor: appTheme.gray600,
                          unselectedLabelStyle: TextStyle(
                              fontSize: 12.fSize,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400),
                          indicatorPadding: EdgeInsets.all(4.0.h),
                          indicator: BoxDecoration(
                              color: appTheme.teal400,
                              borderRadius: BorderRadius.circular(13.h)),
                          tabs: [
                            Tab(child: Text("Yearly")),
                            Tab(child: Text("Monthly")),
                            Tab(child: Text("Weekly"))
                          ]))
                ])));
  }

  Widget _buildPlaylist(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 18.h, bottom: 20.v),
      
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          
          Divider(
            color: theme.colorScheme.onError,
            indent: 4.h,
          ),
          SizedBox(height: 20.v),
          Align(
            alignment: Alignment.centerLeft,
            child: SizedBox(
              height: 231.v,
              width: 347.h,
              child: Stack(
                alignment: Alignment.centerRight,
                children: [
                  
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      children: [
                        Text(
                          "6hr",
                          style: theme.textTheme.bodySmall,
                        ),
                        SizedBox(height: 19.v),
                        Text(
                          "5hr",
                          style: theme.textTheme.bodySmall,
                        ),
                        SizedBox(height: 19.v),
                        Text(
                          "4hr",
                          style: theme.textTheme.bodySmall,
                        ),
                        SizedBox(height: 18.v),
                        Text(
                          "3hr",
                          style: theme.textTheme.bodySmall,
                        ),
                        SizedBox(height: 19.v),
                        Text(
                          "2hr",
                          style: theme.textTheme.bodySmall,
                        ),
                        SizedBox(height: 18.v),
                        Text(
                          "1hr",
                          style: theme.textTheme.bodySmall,
                        ),
                        SizedBox(height: 19.v),
                        Text(
                          "0",
                          style: theme.textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      width: 327.h,
                      margin: EdgeInsets.only(
                        left: 10.h,
                        top: 6.v,
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 7.h),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: fs.Svg(
                            ImageConstant.imgGroup37,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Spacer(
                            flex: 34,
                          ),
                          CustomImageView(
                            imagePath: ImageConstant.imgBar12,
                            height: 171.v,
                            width: 21.h,
                            margin: EdgeInsets.only(top: 51.v, left: 20.h),
                          ),
                          CustomImageView(
                            imagePath: ImageConstant.imgBar12,
                            height: 63.v,
                            width: 21.h,
                            margin: EdgeInsets.only(
                              left: 15.h,
                              top: 160.v,
                            ),
                          ),
                          CustomImageView(
                            imagePath: ImageConstant.imgBar12,
                            height: 31.v,
                            width: 21.h,
                            margin: EdgeInsets.only(
                              left: 22.h,
                              top: 192.v,
                            ),
                          ),
                          Spacer(
                            flex: 65,
                          ),
                          CustomImageView(
                            imagePath: ImageConstant.imgBar12,
                            height: 182.v,
                            width: 21.h,
                            margin: EdgeInsets.only(top: 41.v, right: 25.h),
                          ),
                        ],
                      ),
                    ),
                  ),
                  CustomImageView(
                    imagePath: ImageConstant.imgBar12DeepOrangeA100,
                    height: 210.v,
                    width: 21.h,
                    alignment: Alignment.bottomRight,
                    margin: EdgeInsets.only(right: 108.h),
                  ),
                  CustomImageView(
                    imagePath: ImageConstant.imgBar12,
                    height: 101.v,
                    width: 21.h,
                    alignment: Alignment.bottomRight,
                    margin: EdgeInsets.only(right: 70.h),
                  ),
                  CustomImageView(
                    imagePath: ImageConstant.imgBar12,
                    height: 132.v,
                    width: 21.h,
                    alignment: Alignment.bottomLeft,
                    margin: EdgeInsets.only(left: 42.h),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 15.v),
          Padding(
            padding: EdgeInsets.only(
              left: 46.h,
              right: 44.h,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "M".toUpperCase(),
                  style: CustomTextStyles.bodySmall11_1,
                ),
                Spacer(
                  flex: 19,
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "T".toUpperCase(),
                        style: CustomTextStyles.bodySmall11,
                      ),
                      TextSpan(
                        text: "u",
                        style: CustomTextStyles.bodySmall11,
                      ),
                    ],
                  ),
                  textAlign: TextAlign.left,
                ),
                Spacer(
                  flex: 20,
                ),
                Text(
                  "W".toUpperCase(),
                  style: CustomTextStyles.bodySmall11_1,
                ),
                Spacer(
                  flex: 21,
                ),
                Text(
                  "Th",
                  style: CustomTextStyles.bodySmall11_1,
                ),
                Spacer(
                  flex: 21,
                ),
                Text(
                  "F".toUpperCase(),
                  style: CustomTextStyles.bodySmall11_1,
                ),
                Spacer(
                  flex: 17,
                ),
                Text(
                  "Sa",
                  style: CustomTextStyles.bodySmall11_1,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 25.h),
                  child: Text(
                    "Su",
                    style: CustomTextStyles.bodySmall11_1,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Navigates back to the previous screen.
  onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }
}